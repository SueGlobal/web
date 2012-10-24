# -*- encoding : utf-8 -*-
class AddCheckFieldsToGeneralFrames < ActiveRecord::Migration
  def change
    add_column :general_frames, :bachelors_degree_graduates_check, :boolean
    add_column :general_frames, :degree_graduates_check, :boolean
    add_column :general_frames, :graduates_check, :boolean
    add_column :general_frames, :master_graduates_check, :boolean
    add_column :general_frames, :number_of_campus_check, :boolean
    add_column :general_frames, :number_of_masters_degree_check, :boolean
    add_column :general_frames, :number_of_qualifications_check, :boolean
    add_column :general_frames, :year_check, :boolean
    add_column :general_frames, :phd_graduates_check, :boolean
    add_column :general_frames, :specific_qualifications_graduates_check, :boolean
    add_column :general_frames, :number_of_phds_check, :boolean
    add_column :general_frames, :number_of_specific_qualifications_check, :boolean
  end
end
