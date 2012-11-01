class AddSlugsToUniversityDependentModel < ActiveRecord::Migration
  def change
    tables = [:achieved_activities, :general_frames, :student_studies, :services]
    tables.each do |t|
      add_column t, :slug, :string
      add_index t, :slug, unique: true
    end
  end
end
