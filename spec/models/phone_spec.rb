require "rails_helper"

describe Phone do
  context "associations" do
    it { should belong_to(:business) }
  end
end