class CreateIndexConfirmations < ActiveRecord::Migration
  def change
    create_table :index_confirmations do |t|
      t.references :user
      t.references :index
      t.boolean :accepted
      t.timestamp :accepted_at
      t.string :slug

      t.timestamps
    end
    add_index :index_confirmations, :user_id
    add_index :index_confirmations, :index_id
    add_index :index_confirmations, :slug
  end
end
