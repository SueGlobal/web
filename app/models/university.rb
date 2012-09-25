# -*- encoding : utf-8 -*-
class University < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :province
  belongs_to :province

  validates :name,
    presence: true,
    uniqueness: true

  validates :abbreviation,
    presence: true,
    uniqueness: true
end
