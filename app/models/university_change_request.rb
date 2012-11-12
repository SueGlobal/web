class UniversityChangeRequest < ActiveRecord::Base
  belongs_to :university
  belongs_to :user
  attr_accessible :token, :user, :university, :state
  after_create :send_notification_email
  before_create :set_token

  def done?
    self.state == 'done'
  end

  def pending?
    self.state == 'pending'
  end

  class << self

    def change opts={}
      if opts[:user].university == opts[:university]
        create(user: opts[:user], university: opts[:university], state: 'done')
      else
        create(user: opts[:user], university: opts[:university], state: 'pending')
      end
    end

  end

  protected

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
