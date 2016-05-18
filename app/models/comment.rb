class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :business_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
end
