# -*- encoding : utf-8 -*-
class PublicSourceStudy < ActiveRecord::Base
  include Study

  include_questions :basic_question, :class_year_question,
    :funding_question, :information_question,
    :software_question, :source_question

  belongs_to :university
  attr_accessible :slug, :variables, :notes, :population

  def column_for_slug
    basic_question.title
  end
end
