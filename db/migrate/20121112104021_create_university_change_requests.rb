class CreateUniversityChangeRequests < ActiveRecord::Migration
  def change
    create_table :university_change_requests do |t|
      t.references :university
      t.references :user
      t.string :token

      t.timestamps
    end
    add_index :university_change_requests, :university_id
    add_index :university_change_requests, :user_id
    add_index :university_change_requests, :token
  end
end
