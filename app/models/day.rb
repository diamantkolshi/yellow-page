class Day < ActiveRecord::Base
	has_many :working_days

	validates :name, presence: true
end
