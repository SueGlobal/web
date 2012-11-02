# -*- encoding : utf-8 -*-
class AddDegreesToGeneralFrames < ActiveRecord::Migration
  def change
    add_column :general_frames, :number_of_degrees, :integer
    add_column :general_frames, :number_of_degrees_check, :boolean
    add_column :general_frames, :number_of_bachelor_degrees, :integer
    add_column :general_frames, :number_of_bachelor_degrees_check, :boolean
  end
end
