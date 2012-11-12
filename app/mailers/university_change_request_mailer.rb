class UniversityChangeRequestMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.university_change_request_mailer.request.subject
  #
  def request_email ucr
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.university_change_request_mailer.acceptance.subject
  #
  def acceptance_email ucr
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
