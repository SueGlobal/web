# -*- encoding : utf-8 -*-
class AddStudiableIndexToFieldWorkQuestions < ActiveRecord::Migration
  def change
    add_index :field_work_questions, [:studiable_id, :studiable_type]
  end
end
