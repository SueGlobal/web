# -*- encoding : utf-8 -*-
class CreateSoftwareQuestions < ActiveRecord::Migration
  def change
    create_table :software_questions do |t|
      t.boolean :uses_some
      t.text :description

      t.timestamps
    end
  end
end
