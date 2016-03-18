require "rails_helper"

describe Business do
  context "associations" do
    it { should have_many(:business_cities) }
    it { should have_many(:business_categories) }
    it { should have_many(:cities).through(:business_cities) }    
    it { should have_many(:categories).through(:business_categories) }    
    it { should have_many(:phones) }
    it { should have_many(:photos) }
    it { should have_many(:videos) }
    it { should have_many(:products) }
    it { should have_many(:working_days) }
  end

  context "validations" do
  
  end
end