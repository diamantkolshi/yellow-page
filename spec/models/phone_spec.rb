require "rails_helper"

describe Phone do
  context "associations" do
    it { should belong_to(:business) }
  end

  context "validations" do
     it { should validate_presence_of :business }
     it { should validate_presence_of :phone_type }
     it { should validate_presence_of :phone_number } 
  end
end