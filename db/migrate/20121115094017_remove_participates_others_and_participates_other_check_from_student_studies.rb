# -*- encoding : utf-8 -*-
class RemoveParticipatesOthersAndParticipatesOtherCheckFromStudentStudies < ActiveRecord::Migration
  def up
    remove_column :student_studies, :participates_others
    remove_column :student_studies, :participates_others_check
  end

  def down
    add_column :student_studies, :participates_others, :text
    add_column :student_studies, :participates_others_check, :boolean
  end
end
