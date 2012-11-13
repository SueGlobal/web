# -*- encoding : utf-8 -*-
class UniversityChangeRequest < ActiveRecord::Base
  belongs_to :university
  belongs_to :previous_university, class_name: 'University'
  belongs_to :user
  attr_accessible :token, :user, :university, :state
  after_create :send_notification_email
  before_create :set_token
  before_create :set_previous_university

  def done?
    self.state == 'done'
  end

  def pending?
    self.state == 'pending'
  end

  def complete_request
    if pending?
      self.state = 'done'
      user.university = university
      send_notification_email if user.save
    end
  end

  class << self

    def change opts={}
      if opts[:user].university == opts[:university]
        create(user: opts[:user], university: opts[:university], state: 'done')
      else
        create(user: opts[:user], university: opts[:university], state: 'pending')
      end
    end

    def do_change token
      ucr = self.where(state: 'pending', token: token).first
      ucr.complete_request if ucr
    end
  end

  protected

  def set_previous_university
    self.previous_university = user.university
  end

  def set_token
    self.token = ::Sorcery::Model::TemporaryToken.generate_random_token
  end

  def send_notification_email
    get_mail.deliver
  end

  def get_mail
    if done?
      UniversityChangeRequestMailer.acceptance_email(self)
    else
      UniversityChangeRequestMailer.request_email(self)
    end
  end
end
