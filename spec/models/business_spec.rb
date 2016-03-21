require "rails_helper"

describe Business do
  context "associations" do
    it { should have_many(:business_cities) }
    it { should have_many(:business_categories) }
    it { should have_many(:cities).through(:business_cities) }
    it { should have_many(:categories).through(:business_categories) }
    it { should have_many(:phones) }
    it { should have_many(:photos) }
    it { should have_many(:videos) }
    it { should have_many(:products) }
    it { should have_many(:working_days) }
  end

  context "validations" do
    it { should validate_presence_of :name }
  end

  describe "#create_dir" do
    before(:each) do
      # @business = FactoryGirl.create(:business, name: "Mozaix")
    end

    it "create dir for this business" do
      # expect(File).to exist(business_dir)
    end

    describe "#destroy_dir" do
      before(:each) do
        # @business.destroy
      end

      it "destroy business dir" do
        # expect(File).not_to exist(business_dir)
      end
    end
  end
end

def business_dir
  # "#{Rails.public_path}/uploads/#{@business.class.to_s.pluralize.downcase}/#{@business.id}"
end
