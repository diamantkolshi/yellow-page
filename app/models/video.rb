class Video < ActiveRecord::Base
  belongs_to :business

  validates :business, presence: true
  validates :source, presence: true
  before_create :embed

  def embed
  	youtube_id = self.source.split("=").last
  	self.source = "//www.youtube.com/embed/#{youtube_id}"
  end

end
