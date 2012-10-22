# -*- encoding : utf-8 -*-
class StudyPeriodicityQuestion < ActiveRecord::Base
  belongs_to :studiable, polymorphic: true
  has_one :periodicity, as: :periodic

  attr_accessible :periodicity_attributes
  accepts_nested_attributes_for :periodicity

  def periodicity
    super || build_periodicity
  end
end
