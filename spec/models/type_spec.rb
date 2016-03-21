require 'rails_helper'


describe Type do
  context "associations" do
    it { should have_many(:products) }
  end

  context "validations" do
  end
end
