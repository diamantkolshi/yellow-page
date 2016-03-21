require "rails_helper"

describe Category do
  context "associations" do
    it { should have_many(:business_categories) }
    it { should have_many(:businesses).through(:business_categories) } 
  end

    context "validations" do
     it { should validate_presence_of :name }
  end
end