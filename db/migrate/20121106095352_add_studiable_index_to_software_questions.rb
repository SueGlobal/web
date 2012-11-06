# -*- encoding : utf-8 -*-
class AddStudiableIndexToSoftwareQuestions < ActiveRecord::Migration
  def change
    add_index :software_questions, [:studiable_id, :studiable_type]
  end
end
