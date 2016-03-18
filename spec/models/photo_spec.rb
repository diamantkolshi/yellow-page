require "rails_helper"

describe Photo do
  context "associations" do
    it { should belong_to(:business) }
  end
end