# -*- encoding : utf-8 -*-
class AddStudiableIndexToSampleQuestions < ActiveRecord::Migration
  def change
    add_index :sample_questions, [:studiable_id, :studiable_type]
  end
end
