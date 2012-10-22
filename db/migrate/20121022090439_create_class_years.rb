# -*- encoding : utf-8 -*-
class CreateClassYears < ActiveRecord::Migration
  def change
    create_table :class_years do |t|
      t.integer :year
      t.boolean :significant
      t.references :class_year_question

      t.timestamps
    end

    add_index :class_years, :class_year_question_id
  end
end
