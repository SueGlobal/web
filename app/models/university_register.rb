# -*- encoding : utf-8 -*-
class UniversityRegister

  attr_accessor :failed_users, :pending_users, :activated_users

  def initialize university, emails
    @university = university
    @emails = emails
    @pending_users = []
    @activated_users = []
    @failed_users = []
  end

  def success?
    failed_users.empty? && pending_users.empty?
  end

  def register_users
    @emails.each do |current_email|
      user = User.find_by_email current_email

      if user
        deal_with_registered_user user
      else
        deal_with_unregistered_user current_email
      end
    end
  end

  def save
    @university.save.tap do |value|
      register_users if value
    end
  end

  protected

  def deal_with_unregistered_user current_email
    password = generate_password
    user = User.new email: current_email, password: password, password_confirmation: password
    user.university = @university
    change_email_method_for user
    if user.save
      user.password = password
      user.activate!
      activated_users << user
    else
      failed_users << user
    end
  end

  def deal_with_registered_user user
    uc = user.change_university_to @university
    if uc.save
      pending_users << user
    else
      failed_users <<  user
    end
  end

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
