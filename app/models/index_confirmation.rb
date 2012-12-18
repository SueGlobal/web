class IndexConfirmation < ActiveRecord::Base
  belongs_to :user
  belongs_to :index
  attr_accessible :accepted, :accepted_at

  before_create :set_accepted_to_false
  before_create :set_slug

  def confirm
    self.accepted = true
    self.accepted_at = Time.zone.now
    self.save
    index.check_all_accepted
  end

  def reject
    self.accepted = false
    self.save
    index.reject
  end

  def active?
    self.index && !self.index.confirmed?
  end

  protected
  def set_accepted_to_false
    self.accepted = false
    true
  end

  def set_slug
    self.slug = ::Sorcery::Model::TemporaryToken.generate_random_token
  end
end
