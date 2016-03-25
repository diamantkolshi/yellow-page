class SuggestBusiness < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :tel, presence: true
end
