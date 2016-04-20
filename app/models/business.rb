class Business < ActiveRecord::Base
  mount_uploader :logo, LogoUploader 
  
  searchkick word_start: [:name]

  paginates_per 4
 
  acts_as_commontable

  has_many :business_cities
  has_many :business_categories
  has_many :business_products
  has_many :cities, through: :business_cities
  has_many :categories, through: :business_categories
  has_many :products, through: :business_products
  has_many :phones
  has_many :photos
  has_many :videos
  has_many :working_days

  validates :name, presence: true
  # validates :address, presence: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  after_create  :create_dir
  after_destroy :destroy_dir


  def create_dir
     # dir_path = "#{Rails.public_path}/uploads/#{self.class.to_s.pluralize.downcase}/#{self.id}"
     # FileUtils.mkdir_p(dir_path)
  end

  def destroy_dir
     FileUtils.remove_dir("#{Rails.public_path}/uploads/#{self.class.to_s.pluralize.downcase}/#{self.id}")     
  end

  def open
    if self.working_days == []
          return []
    else
      if self.working_days != []
      self.working_days.each do |wd|
           wd.day.name.capitalize == Time.now.strftime("%A")
        if (wd.open.strftime("%H:%M")..wd.close.strftime("%H:%M")).include?(Time.now.strftime("%H:%M"))
          return true
        else
          return false
          end
        end 
      end
    end
  end
  
end


