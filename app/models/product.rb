class Product < ActiveRecord::Base
  belongs_to :type
  has_many :business_products
  has_many :businesses, through: :business_products

  validates :type, presence: true
  validates :name, presence: true	
end
