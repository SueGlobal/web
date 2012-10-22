# -*- encoding : utf-8 -*-
class CreatePeriodicities < ActiveRecord::Migration
  def change
    create_table :periodicities do |t|
      t.string :periodicity_type
      t.text :other_description
      t.references :periodic, polymorphic: true

      t.timestamps
    end
    add_index :periodicities, [:periodic_id, :periodic_type]
  end
end
