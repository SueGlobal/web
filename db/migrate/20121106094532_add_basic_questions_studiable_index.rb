# -*- encoding : utf-8 -*-
class AddBasicQuestionsStudiableIndex < ActiveRecord::Migration
  def change
    add_index :basic_questions, [:studiable_id, :studiable_type]
  end
end
