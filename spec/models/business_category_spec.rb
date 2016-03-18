require "rails_helper"

describe BusinessCategory do
  context "associations" do
    it { should belong_to(:business) }
    it { should belong_to(:category) }
  end
end