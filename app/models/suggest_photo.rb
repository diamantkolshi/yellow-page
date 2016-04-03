class SuggestPhoto < ActiveRecord::Base
 	mount_uploader :source, PhotoUploader
end

