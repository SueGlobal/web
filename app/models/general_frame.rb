class GeneralFrame < ActiveRecord::Base
  belongs_to :university
  attr_accessible :bachelors_degree_graduates, :degree_graduates,
    :graduates, :master_graduates, :number_of_campus,
    :number_of_masters_degree, :number_of_qualifications, :year

  validates :bachelors_degree_graduates,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  validates :degree_graduates,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  validates :graduates,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  validates :master_graduates,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  validates :number_of_campus,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  validates :number_of_masters_degree,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  validates :number_of_qualifications,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  validates :year,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true
end
