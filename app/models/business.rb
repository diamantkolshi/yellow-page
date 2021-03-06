class Business < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :logo, LogoUploader

  searchkick

  paginates_per 4


  has_many :business_addresses
  has_many :business_categories
  has_many :business_products
  has_many :categories, through: :business_categories
  has_many :products, through: :business_products
  has_many :addresses, through: :business_addresses
  has_many :phones
  has_many :photos
  has_many :videos
  has_many :working_days
  has_many :comments

  validates :name, presence: true

  # after_create  :create_dir
  # after_destroy :destroy_dir
  after_commit :reindex_business


  def reindex_business
    Business.reindex
  end

  def search_data
    attributes.merge(
      product_name: products.map(&:name),
      address_name: addresses.map(&:name),
      city_id: addresses.map(&:city_id),
      category_name: categories.map(&:name)
    )
  end

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end

  def create_dir
    # dir_path = "#{Rails.public_path}/uploads/#{self.class.to_s.pluralize.downcase}/#{self.id}"
    # FileUtils.mkdir_p(dir_path)
  end

  def destroy_dir
    # FileUtils.remove_dir("#{Rails.public_path}/uploads/#{self.class.to_s.pluralize.downcase}/#{self.id}")
  end

  def open
    status_day = []
    if self.working_days == []
      return status_day
    else
      self.working_days.each do |wd|
        if wd.day.name.capitalize == Time.now.strftime("%A")
          if (wd.open.strftime("%H:%M")..wd.close.strftime("%H:%M")).include?(Time.now.strftime("%H:%M"))
            status_day = true
          else
            status_day = false
          end
        end
      end
    end    
    status_day
  end

end
