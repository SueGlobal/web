# -*- encoding : utf-8 -*-
class AddStudiableIndexToStudyPeriodicityQuestions < ActiveRecord::Migration
  def change
    add_index :study_periodicity_questions, [:studiable_id, :studiable_type], name: :index_study_periodicity_on_studiable
    remove_index :study_periodicity_questions, column: :studiable_id
  end
end
