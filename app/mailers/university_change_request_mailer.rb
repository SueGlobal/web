# -*- encoding : utf-8 -*-
class UniversityChangeRequestMailer < ActionMailer::Base
  default from: APP_CONFIG[:email_address]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.university_change_request_mailer.request.subject
  #
  def request_email ucr
    extract_variables ucr
    @url = accept_change_request_url(ucr.token)

    mail to: @user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.university_change_request_mailer.acceptance.subject
  #
  def acceptance_email ucr
    extract_variables ucr

    mail to: @user.email
  end

  protected
  def extract_variables ucr
    @user = ucr.user
    @university = ucr.university
    @previous_university = ucr.previous_university
  end
end
