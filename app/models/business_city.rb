class BusinessCity < ActiveRecord::Base
  belongs_to :business
  belongs_to :city
end
