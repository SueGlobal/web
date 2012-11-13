# -*- encoding : utf-8 -*-
class AddPreviousUniversityToUniversityChangeRequests < ActiveRecord::Migration
  def change
    add_column :university_change_requests, :previous_university_id, :integer
    add_index :university_change_requests, :previous_university_id
  end
end
