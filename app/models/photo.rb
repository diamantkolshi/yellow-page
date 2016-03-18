class Photo < ActiveRecord::Base  

  mount_uploader :source, PhotoUploader 

  belongs_to :business 
end
