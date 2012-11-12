require 'spec_helper'

describe UniversityChangeRequest do

  describe 'attributes' do
    subject { create :university_change_request }

    it { should allow_mass_assignment_of(:token) }
    it { should allow_mass_assignment_of(:user) }
    it { should allow_mass_assignment_of(:university) }
    it { should allow_mass_assignment_of(:state) }
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
