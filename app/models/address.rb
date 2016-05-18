class Address < ActiveRecord::Base

  belongs_to :city
  has_many :business_addresses
  has_many :businesses, through: :business_addresses

  validates :city, presence: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  after_commit :reindex_business

  def reindex_business
    Business.reindex
  end

end
