class Video < ActiveRecord::Base
  belongs_to :business

  validates :business, presence: true
  validates :source, presence: true
end
