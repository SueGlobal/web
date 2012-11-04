# -*- encoding : utf-8 -*-
class OtherStudy < ActiveRecord::Base
  include Study

  include_questions :basic_question, :funding_question,
                    :information_question, :software_question
  attr_accessible :description, :notes

  validates :description,
    presence: true

  def column_for_slug
    basic_question.title
  end
end
