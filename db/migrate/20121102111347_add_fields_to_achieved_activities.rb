class AddFieldsToAchievedActivities < ActiveRecord::Migration
  def change
    add_column :achieved_activities, :entrepreneur_advising, :boolean
    add_column :achieved_activities, :formation_for_employement, :boolean
  end
end
