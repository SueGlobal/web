require "spec_helper"

describe UniversityChangeRequestMailer do
  describe "request" do
    let(:mail) { UniversityChangeRequestMailer.request }

    it "renders the headers" do
      mail.subject.should eq("Request")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "acceptance" do
    let(:mail) { UniversityChangeRequestMailer.acceptance }

    it "renders the headers" do
      mail.subject.should eq("Acceptance")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
