# -*- encoding : utf-8 -*-
class CreateBasicQuestions < ActiveRecord::Migration
  def change
    create_table :basic_questions do |t|
      t.text :title
      t.text :author
      t.text :population
      t.integer :year
      t.references :studiable, polymorphic: true

      t.timestamps
    end
  end
end
