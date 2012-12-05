# -*- encoding : utf-8 -*-
class CreateSamplesSegmentsTable < ActiveRecord::Migration
  def change
    create_table :samples_segments, id: false do |t|
      t.references :sample, null: false
      t.references :segment, null: false
    end
    add_index :samples_segments, [:sample_id, :segment_id], unique: true
  end
end
