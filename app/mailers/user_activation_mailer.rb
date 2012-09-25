# -*- encoding : utf-8 -*-
class UserActivationMailer < ActionMailer::Base
  default from: "sue-global@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_activation_mailer.activation_needed_email.subject
  #
  def activation_needed_email user
    @user = user
    @url = activate_user_url @user.activation_token
    mail(to: @user.email,
         subject: "Activate your account.")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_activation_mailer.activation_success_email.subject
  #
  def activation_success_email user
    @user = user
    @url = login_url

    mail to: "to@example.org",
         subject: "Account activated."
  end
end
