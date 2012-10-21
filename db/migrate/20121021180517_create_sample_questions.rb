# -*- encoding : utf-8 -*-
class CreateSampleQuestions < ActiveRecord::Migration
  def change
    create_table :sample_questions do |t|
      t.text :scope
      t.text :population
      t.string :sampling_option
      t.text :non_probabilistic_description
      t.text :sampling_type
      t.text :disintegration_level
      t.references :studiable, polymorphic: true

      t.timestamps
    end
  end
end
