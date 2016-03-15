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
end
