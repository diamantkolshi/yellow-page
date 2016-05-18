class WorkingDay < ActiveRecord::Base
  belongs_to :business
  belongs_to :day

  validates :business, presence: true
  validates :day, presence: true
  validates :open, presence: true
  validates :close, presence: true
  validate :unique_day, on: :create

  def unique_day
    self.errors.add(:day_id, "is already exists in " + self.business.name ) if WorkingDay.where(business_id: self.business_id, day_id: self.day_id).exists?
  end


end
