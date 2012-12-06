# -*- encoding : utf-8 -*-
class CreateSampleValues < ActiveRecord::Migration
  def change
    create_table :sample_values do |t|
      t.integer :value_in_cents
      t.references :sample

      t.timestamps
    end
    add_index :sample_values, :sample_id
  end
end
