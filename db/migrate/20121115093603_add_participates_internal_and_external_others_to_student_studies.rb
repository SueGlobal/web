# -*- encoding : utf-8 -*-
class AddParticipatesInternalAndExternalOthersToStudentStudies < ActiveRecord::Migration
  def change
    add_column :student_studies, :participates_internal_other, :text
    add_column :student_studies, :participates_internal_other_check, :boolean
    add_column :student_studies, :participates_external_other, :text
    add_column :student_studies, :participates_external_other_check, :boolean
  end
end
