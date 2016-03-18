require "rails_helper"

describe Video do
  context "associations" do
    it { should belong_to(:business) }
  end
end