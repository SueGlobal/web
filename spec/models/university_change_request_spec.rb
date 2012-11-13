# -*- encoding : utf-8 -*-
require 'spec_helper'

describe UniversityChangeRequest do

  describe 'attributes' do
    subject { create :university_change_request }

    it { should allow_mass_assignment_of(:token) }
    it { should allow_mass_assignment_of(:user) }
    it { should allow_mass_assignment_of(:university) }
    it { should allow_mass_assignment_of(:state) }

    it { should belong_to(:user) }
    it { should belong_to(:university) }
    it { should belong_to(:previous_university).class_name("University") }
  end

  describe '#done?' do
    it "returns true if ucr is done" do
      create(:university_change_request, :done).should be_done
    end

    it "returns false if ucr is pending" do
      create(:university_change_request, :pending).should_not be_done
    end
  end

  describe '#pending?' do
    it "returns true if ucr is pending" do
      create(:university_change_request, :pending).should be_pending
    end

    it "returns false if ucr is pending" do
      create(:university_change_request, :done).should_not be_pending
    end
  end

  describe "#previous_university" do
    it "adds previous university if it exists" do
      old_university = create :university
      new_university = create :university
      user = create :user, university: old_university
      ucr = UniversityChangeRequest.create user: user, university: new_university
      expect(ucr.previous_university).to be(old_university)
    end

    it "does not add previous university if it does not exist" do
      new_university = create :university
      user = create :user, university: nil
      ucr = UniversityChangeRequest.create user: user, university: new_university
      expect(ucr.previous_university).to be_nil
    end
  end

  describe '#complete_request' do
    let(:user) { create :user }
    context 'when ucr is done' do
      let!(:ucr) { create :university_change_request, :done, user: user }

      it "is still done" do
        ucr.complete_request
        ucr.should be_done
      end

      it "does not send any email" do
        expect {
          ucr.complete_request
        }.not_to change { number_of_emails }.by(1)
      end
    end

    context 'when ucr is pending' do
      let!(:ucr) { create :university_change_request, :pending, user: user }

      it "is done" do
        ucr.complete_request
        ucr.should be_done
      end

      it "sends and email" do
        expect {
          ucr.complete_request
        }.to change { number_of_emails }.by(1)
      end

      it "sets the university to the user" do
        ucr.complete_request
        expect(user.reload.university).to eq(ucr.university)
      end
    end
  end

  describe '.do_change' do
    let(:university) { create :university }
    let(:user) { create :user }

    context "if ucr exist" do
      let(:ucr) { create :university_change_request, user: user, university: university }

      it "calls change in ucr" do
        UniversityChangeRequest.should_receive(:where).with(any_args()).and_return([ucr])
        ucr.should_receive(:complete_request)
        UniversityChangeRequest.do_change ucr.token
      end
    end

    context "if ucr does not exist" do

      it "does not fail" do
        UniversityChangeRequest.should_receive(:where).with(any_args()).and_return([])
        UniversityChangeRequest.do_change "some_unknown_token"
      end
    end
  end

  describe '.change' do
    let(:university) { create :university }
    let(:mail) do
      mailer = double('mailer').tap do |o|
        o.should_receive(:deliver).and_return(true)
      end
    end

    context 'if user can already admin that university' do
      let(:user) { create :user, :active, university: university }
      before :each do
        UniversityChangeRequestMailer.should_receive(:acceptance_email) { mail }
        expect {
          @result = UniversityChangeRequest.change user: user, university: university
        }.to change(UniversityChangeRequest, :count).by(1)
      end

      it "returns a UniversityChangeRequest" do
        @result.should be_a(UniversityChangeRequest)
      end

      it "returns a persisted object" do
        @result.should be_persisted
      end

      it "should be done" do
        @result.should be_done
      end

      it "gets a token" do
        @result.token.should_not be_blank
      end
    end

    context 'if user cannot admin that university' do
      let(:user) { create :user, :active, university: nil }

      before :each do
        UniversityChangeRequestMailer.should_receive(:request_email) { mail }
        expect {
          @result = UniversityChangeRequest.change user: user, university: university
        }.to change(UniversityChangeRequest, :count).by(1)
      end

      it "returns a UniversityChangeRequest" do
        @result.should be_a(UniversityChangeRequest)
      end

      it "returns a persisted object" do
        @result.should be_persisted
      end

      it "should be pending" do
        @result.should be_pending
      end

      it "gets a token" do
        @result.token.should_not be_blank
      end
    end
  end
end
