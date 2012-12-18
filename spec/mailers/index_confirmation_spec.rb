require "spec_helper"

describe IndexConfirmation do
  describe "ask_confirmation" do
    let(:mail) { IndexConfirmation.ask_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Ask confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "confirmation_passed" do
    let(:mail) { IndexConfirmation.confirmation_passed }

    it "renders the headers" do
      mail.subject.should eq("Confirmation passed")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "confirmation_failed" do
    let(:mail) { IndexConfirmation.confirmation_failed }

    it "renders the headers" do
      mail.subject.should eq("Confirmation failed")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
