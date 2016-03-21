require "rails_helper"

describe WorkingDay do
  context "associations" do
    it { should belong_to(:business) }
  end

  context "validations" do
    it { should validate_presence_of :business }
    it { should validate_presence_of :open }
    it { should validate_presence_of :close }
  end
end
