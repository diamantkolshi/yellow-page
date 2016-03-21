require 'rails_helper'

describe Day do
  context "associations" do
    it { should have_many(:working_days) }
  end

  context "validations" do
    it { should validate_presence_of :name }
  end
end

