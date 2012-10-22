# -*- encoding : utf-8 -*-
class BasicQuestion < ActiveRecord::Base
  attr_accessible :author, :population, :title, :year

  belongs_to :studiable, polymorphic: true

  validates :title,
    presence: true

  validates :author,
    presence: true

  validates :year,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}

  before_validation do
    self.year = self.year.to_i
  end
end
