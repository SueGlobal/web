# -*- encoding : utf-8 -*-
class ChangeIncludesUniversityDatabasesInAchievedActivities < ActiveRecord::Migration

  def up
    remove_column(:achieved_activities, :includes_university_databases)
    add_column :achieved_activities, :includes_university_databases, :boolean
  end

  def down
    remove_column(:achieved_activities, :includes_university_databases)
    add_column :achieved_activities, :includes_university_databases, :string
  end
end
