# -*- encoding : utf-8 -*-
class DatabaseStudy < ActiveRecord::Base
  include Study

  include_questions :basic_question, :software_question,
    :funding_question, :information_question, :study_periodicity_question
  belongs_to :university

  attr_accessible :analyzer, :database, :description, :notes, :producer, :slug, :variables

  validates :description,
    presence: true

  def column_for_slug
    basic_question.title
  end
end
