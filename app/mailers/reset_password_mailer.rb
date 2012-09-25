# -*- encoding : utf-8 -*-
class ResetPasswordMailer < ActionMailer::Base
  default from: "sue-global@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reset_password_mailer.reset_password_email.subject
  #
  def reset_password_email user
    @user = user
    @url = edit_password_reset_url id: user.reset_password_token

    mail to: user.email,
         subject: 'Reset your password.'
  end
end
