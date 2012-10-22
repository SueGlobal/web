# -*- encoding : utf-8 -*-
class CreateStudyPeriodicityQuestions < ActiveRecord::Migration
  def change
    create_table :study_periodicity_questions do |t|
      t.string :periodicity
      t.text :other_description
      t.references :studiable, polymorphic: true

      t.timestamps
    end
    add_index :study_periodicity_questions, :studiable_id
  end
end
