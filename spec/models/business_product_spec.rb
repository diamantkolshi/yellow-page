require 'rails_helper'

describe BusinessProduct do
  context "associations" do
    it { should belong_to(:business) }
    it { should belong_to(:product) }
  end

  context "validations" do
    it { should validate_presence_of :business }
    it { should validate_presence_of :product }
    it { should validate_presence_of :price }
  end
end
