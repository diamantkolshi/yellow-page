require "rails_helper"

describe City do
  context "associations" do
  	it { should belong_to(:country) }
    it { should have_many(:business_cities) }
    it { should have_many(:businesses).through(:business_cities) } 
  end
end