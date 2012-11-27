# -*- encoding : utf-8 -*-
class CreateIndexSegments < ActiveRecord::Migration
  def change
    create_table :index_segments do |t|
      t.references :index
      t.references :segment

      t.timestamps
    end
    add_index :index_segments, :index_id
    add_index :index_segments, :segment_id
  end
end
