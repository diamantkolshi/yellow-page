class Rating < ActiveRecord::Base

  def self.user_rate(business, user)
    self.where(business_id: business, user_id: user).exists? ? true : false
  end

  def self.added_average(business_id)

    num = 0
    sum = 0

    business = Business.find(business_id)
    business_rate = self.where(business_id: business_id)


    business_rate.each do |rate|
      num = num + 1
      sum = sum + rate.score
    end

    business.average_rate = sum/num
    business.save

  end

  validates :business_id, presence: true
  validates :user_id, presence: true
  validates :score, presence: true

end
