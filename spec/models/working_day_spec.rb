require "rails_helper"

describe WorkingDay do
  context "associations" do
   it { should belong_to(:business) }    
  end
end