require "rails_helper"

describe Video do
  context "associations" do
    it { should belong_to(:business) }
  end

  context "validations" do
    it { should validate_presence_of :business }
    it { should validate_presence_of :source }
  end

  describe "#embed" do
    before(:each) do
        business = FactoryGirl.create(:business, name: "Mozaix")
        @video = FactoryGirl.create(:video, business_id: business.id,source: "https://www.youtube.com/watch?v=LW8p2F3gpMo")
    end

    it "change watch to embed" do
       expect(@video.source).to eq("//www.youtube.com/embed/LW8p2F3gpMo")
    end
  end
end
