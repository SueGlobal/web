# -*- encoding : utf-8 -*-
class CreateFundingQuestions < ActiveRecord::Migration
  def change
    create_table :funding_questions do |t|
      t.boolean :fixed_state_funding
      t.boolean :variable_state_funding
      t.boolean :fixed_private_funding
      t.boolean :variable_private_funding
      t.references :studiable, polymorphic: true

      t.timestamps
    end
    add_index :funding_questions, :studiable_id
  end
end
