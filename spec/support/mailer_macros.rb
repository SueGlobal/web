# -*- encoding : utf-8 -*-
module MailerMacros

  def number_of_emails
    ActionMailer::Base.deliveries.size
  end

  def last_email
    ActionMailer::Base.deliveries.size
  end
end
