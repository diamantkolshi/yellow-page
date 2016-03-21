require "rails_helper"

describe Country do
  context "associations" do
    it { should have_many(:cities) }
  end

  context "validations" do
    it { should validate_presence_of :name }
  end
end
