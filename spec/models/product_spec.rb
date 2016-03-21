require "rails_helper"

describe Product do
  context "associations" do
    it { should belong_to(:type) }
    it { should have_many(:business_products) }
  end

  context "validations" do
    it { should validate_presence_of :type }
    it { should validate_presence_of :name }
  end
end
