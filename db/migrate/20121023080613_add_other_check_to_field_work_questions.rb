# -*- encoding : utf-8 -*-
class AddOtherCheckToFieldWorkQuestions < ActiveRecord::Migration
  def change
    add_column :field_work_questions, :other_check, :boolean
  end
end
