# -*- encoding : utf-8 -*-
class RemovePopulationFromBasicQuestions < ActiveRecord::Migration
  def up
    remove_column :basic_questions, :population
  end

  def down
    add_column :basic_questions, :population, :text
  end
end
