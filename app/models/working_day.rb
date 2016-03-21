class WorkingDay < ActiveRecord::Base
  belongs_to :business
  belongs_to :day

  validates :business, presence: true
  validates :day, presence: true
  validates :open, presence: true
  validates :close, presence: true

end
