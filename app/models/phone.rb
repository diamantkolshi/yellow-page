class Phone < ActiveRecord::Base
  belongs_to :business

  validates :business, presence: true
  validates :phone_type, presence: true
  validates :phone_number, presence: true
end
