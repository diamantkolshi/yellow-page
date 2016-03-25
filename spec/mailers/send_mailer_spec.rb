require "rails_helper"

RSpec.describe SendMailer, type: :mailer do
  describe "business_suggest" do
    let(:mail) { SendMailer.business_suggest }

    it "renders the headers" do
      expect(mail.subject).to eq("Business suggest")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
