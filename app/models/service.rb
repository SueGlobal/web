# -*- encoding : utf-8 -*-
class Service < ActiveRecord::Base
  include UniversityDependentModel
  attr_accessible :dependency, :name

  validates :name,
    presence: true

  validates :dependency,
    presence: true
end
