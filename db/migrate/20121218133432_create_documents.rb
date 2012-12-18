class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.string :type
      t.string :file
      t.string :slug
      t.boolean :published

      t.timestamps
    end
    add_index :documents, :type
    add_index :documents, :slug
    add_index :documents, :published
  end
end
