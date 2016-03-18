require "rails_helper"

describe BusinessCity do
  context "associations" do
    it { should belong_to(:business) }
    it { should belong_to(:city) }
  end
end