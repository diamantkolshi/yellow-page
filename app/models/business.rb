class Business < ActiveRecord::Base
  mount_uploader :logo, LogoUploader 

  has_many :business_cities
  has_many :business_categories
  has_many :cities, :through => :business_cities
  has_many :categories, through: :business_categories
  has_many :phones
  has_many :photos
  has_many :videos
  has_many :products
  has_many :working_days

  validates :name, presence: true
  
  after_create  :create_dir
  after_destroy :destroy_dir


  def create_dir
     # dir_path = "#{Rails.public_path}/uploads/#{self.class.to_s.pluralize.downcase}/#{self.id}"
     # FileUtils.mkdir_p(dir_path)
  end

  def destroy_dir
     FileUtils.remove_dir("#{Rails.public_path}/uploads/#{self.class.to_s.pluralize.downcase}/#{self.id}")     
  end

end


