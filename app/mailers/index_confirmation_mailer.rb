class IndexConfirmationMailer < ActionMailer::Base
  default from: APP_CONFIG[:email_address]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.index_confirmation.ask_confirmation.subject
  #
  def ask_confirmation user, index_confirmation
    I18n.locale = user.locale
    @confirm_url = index_confirm_url(index_confirmation.slug)
    @reject_url = index_reject_url(index_confirmation.slug)
    @index = index_confirmation.index
    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.index_confirmation.confirmation_passed.subject
  #
  def confirmation_passed user, index
    I18n.locale = user.locale
    @index = index
    @index_url = index_url(index)
    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.index_confirmation.confirmation_failed.subject
  #
  def confirmation_failed user, index
    I18n.locale = user.locale
    @index = index

    mail to: user.email
  end
end
