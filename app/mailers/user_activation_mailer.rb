# -*- encoding : utf-8 -*-
class UserActivationMailer < ActionMailer::Base
  default from: APP_CONFIG[:email_address]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_activation_mailer.activation_needed_email.subject
  #
  def activation_needed_email user
    @user = user
    @url = activate_user_url @user.activation_token

    I18n.with_locale(@user.locale) do
      mail to: @user.email,
           subject: I18n.t("mailers.user_activation.activation_needed_email.subject")
    end
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_activation_mailer.activation_success_email.subject
  #
  def activation_success_email user
    @user = user
    @url = login_url

    I18n.with_locale(@user.locale) do
      mail to: @user.email,
           subject: I18n.t('mailers.user_activation.activation_success_email.subject')
    end
  end

  def activation_for_registered_users_email user
    @user = user
    @url = login_url
    @university = user.university

    I18n.with_locale(@user.locale) do
      mail to: @user.email,
           subject: I18n.t('mailers.user_activation.activation_for_registered_users_email.subject')
    end
  end
end
