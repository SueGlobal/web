class AddStateToUniversityChangeRequests < ActiveRecord::Migration
  def change
    add_column :university_change_requests, :state, :string
    add_index :university_change_requests, :state
  end
end
