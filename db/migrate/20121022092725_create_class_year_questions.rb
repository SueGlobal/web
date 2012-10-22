# -*- encoding : utf-8 -*-
class CreateClassYearQuestions < ActiveRecord::Migration
  def change
    create_table :class_year_questions do |t|
      t.string :time_from_graduation_type
      t.text :time_from_graduation_other
      t.references :studiable, polymorphic: true

      t.timestamps
    end

    add_index :class_year_questions, [:studiable_id, :studiable_type]
  end
end
