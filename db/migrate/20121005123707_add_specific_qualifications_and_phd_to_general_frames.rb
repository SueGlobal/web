class AddSpecificQualificationsAndPhdToGeneralFrames < ActiveRecord::Migration
  def change
    add_column :general_frames, :specific_qualifications_graduates, :integer
    add_column :general_frames, :phd_graduates, :integer
    add_column :general_frames, :number_of_specific_qualifications, :integer
    add_column :general_frames, :number_of_phds, :integer
  end
end
