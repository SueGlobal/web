# -*- encoding : utf-8 -*-
class ClassYear < ActiveRecord::Base
  attr_accessible :significant, :year
  belongs_to :class_year_question

  before_validation do
    self.year = year.to_i
  end

  class << self

    def select_options
      (APP_CONFIG[:courses_start_year]..Time.now.year).map do |y|
        ["#{y} / #{y+1}", y]
      end
    end
  end
end
