class Photo < ActiveRecord::Base  

  mount_uploader :source, PhotoUploader 
  belongs_to :business 
  
  validates :business, presence: true
  validates :source, presence: true

end
