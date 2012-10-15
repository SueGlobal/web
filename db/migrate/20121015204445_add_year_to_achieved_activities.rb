# -*- encoding : utf-8 -*-
class AddYearToAchievedActivities < ActiveRecord::Migration
  def change
    add_column :achieved_activities, :year, :integer
  end
end
