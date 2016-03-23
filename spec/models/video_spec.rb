require "rails_helper"

describe Video do
  context "associations" do
    it { should belong_to(:business) }
  end

  context "validations" do
    it { should validate_presence_of :business }
    it { should validate_presence_of :source }
  end

  describe "#embed" do 
  end
end
