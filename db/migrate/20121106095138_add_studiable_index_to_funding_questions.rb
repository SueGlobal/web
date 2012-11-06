# -*- encoding : utf-8 -*-
class AddStudiableIndexToFundingQuestions < ActiveRecord::Migration
  def change
    add_index :funding_questions, [:studiable_id, :studiable_type]
  end
end
