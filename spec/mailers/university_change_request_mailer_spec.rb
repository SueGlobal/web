# -*- encoding : utf-8 -*-
require "spec_helper"

describe UniversityChangeRequestMailer do
  let(:user) { create :user }
  let(:university) { create :university }
  let(:ucr) { create :university_change_request, user: user, university: university }
  describe "request" do
    let(:mail) { UniversityChangeRequestMailer.request_email ucr }

    it "renders the headers" do
      mail.subject.should eq(I18n.t('university_change_request_mailer.request_email.subject'))
      mail.to.should eq([user.email])
      mail.from.should eq([APP_CONFIG[:email_address]])
    end

    it "renders the body" do
      expect(mail.body).to match(university.name)
      expect(mail.body).to match(university.abbreviation)
      expect(mail.body).to match(accept_change_request_url(ucr.token))
    end
  end

  describe "acceptance" do
    let(:mail) { UniversityChangeRequestMailer.acceptance_email ucr }

    it "renders the headers" do
      mail.subject.should eq(I18n.t('university_change_request_mailer.acceptance_email.subject'))
      mail.to.should eq([user.email])
      mail.from.should eq([APP_CONFIG[:email_address]])
    end

    it "renders the body" do
      expect(mail.body).to match(university.name)
    end
  end

end
