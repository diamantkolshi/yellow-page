class WorkingDay < ActiveRecord::Base
  belongs_to :business

  validates :business, presence: true
  validates :open, presence: true
  validates :close, presence: true
end
