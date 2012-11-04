# -*- encoding : utf-8 -*-
class CreateSourceQuestions < ActiveRecord::Migration
  def change
    create_table :source_questions do |t|
      t.text :source
      t.text :bias
      t.text :data_format
      t.references :studiable, polymorphic: true

      t.timestamps
    end
    add_index :source_questions, [:studiable_id, :studiable_type]
  end
end
