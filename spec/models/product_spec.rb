require "rails_helper"

describe Product do
  context "associations" do
       it { should belong_to(:business) }
  end
end