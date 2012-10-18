class BasicQuestion < ActiveRecord::Base
  attr_accessible :author, :population, :title, :year

  belongs_to :studiable, polymorphic: true

  validates :title,
    presence: true

  validates :author,
    presence: true

  validates :year,
    numericality: {only_integer: true, greater_than_or_equal_to: 0}
end
