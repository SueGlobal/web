# -*- encoding : utf-8 -*-
class Source < ActiveRecord::Base
  attr_accessible :name, :uri

  validates :name,
    presence: true

  include FriendlyId
  friendly_id :name_for_slug, use: :slugged
  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  def name_for_slug
    name
  end

  def to_key
    [slug]
  end
end
