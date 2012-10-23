# -*- encoding : utf-8 -*-
class AddsQuestionnaireLinkToFieldWorkQuestions < ActiveRecord::Migration
  def up
    add_column :field_work_questions, :questionnaire_link, :text
    # Since it has not been launched yet, not moving data needed. yay!
    remove_column :student_studies, :questionnaire_link
  end

  def down
    remove_column :field_work_questions, :questionnaire_link
    add_column :student_studies, :questionnaire_link, :text
  end
end
