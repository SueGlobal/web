# -*- encoding : utf-8 -*-
class UniversityRegister

  def initialize university, emails
    @university = university
    @emails = emails
    @failed_users = []
  end

  def register_users
    @emails.each do |current_email|
      password = generate_password
      user = User.new email: current_email, password: password, password_confirmation: password
      user.university = @university
      change_email_method_for user
      if user.save
        user.password = password
        user.activate!
      else
        failed_users << user
      end
    end
  end

  def save
    @university.save.tap do |value|
      register_users if value
    end
  end

  protected
  # TODO email failed users
  def generate_password
    sprintf('%06d', rand(999999))
  end

  def change_email_method_for user
    def user.send_activation_needed_email!
      # Do nothing
    end

    def user.send_activation_success_email!
      UserActivationMailer.activation_for_registered_users_email(self).deliver
    end
  end
end
