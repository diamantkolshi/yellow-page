class Business < ActiveRecord::Base
  has_many :business_cities
  has_many :business_categories
  has_many :cities, :through => :business_cities
  has_many :categories, through: :business_categories
  has_many :phones
  has_many :photos
  has_many :videos
  has_many :products
  has_many :working_days
  
  after_create  :create_dir
  after_destroy :destroy_dir

  def create_dir
     Dir.mkdir("#{Rails.root}/app/assets/images/businesses/#{self.name}-#{self.id}")
  end

  def destroy_dir
  	 Dir.rmdir("#{Rails.root}/app/assets/images/businesses/#{self.name}-#{self.id}")
  end

end


