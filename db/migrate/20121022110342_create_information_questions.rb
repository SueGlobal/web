class CreateInformationQuestions < ActiveRecord::Migration
  def change
    create_table :information_questions do |t|
      t.boolean :university_government_check
      t.references :university_government_periodicity
      t.boolean :social_council_check
      t.references :social_council_periodicity
      t.boolean :faculties_management_check
      t.references :faculties_management_periodicity
      t.boolean :university_other_check
      t.references :university_other_periodicity
      t.text :university_other_description
      t.boolean :students_check
      t.references :student_periodicity
      t.boolean :prestudent_check
      t.references :prestudent_periodicity
      t.boolean :counselor_check
      t.references :counselor_periodicity
      t.boolean :students_parents_check
      t.references :students_parents_periodicity
      t.boolean :prestudents_parents_check
      t.references :prestudents_parents_periodicity
      t.boolean :society_check
      t.references :society_periodicity
      t.boolean :employers_check
      t.references :employers_periodicity
      t.boolean :public_administrations_check
      t.references :public_administrations_periodicity
      t.boolean :external_other_check
      t.references :external_other_periodicity
      t.text :external_other_description

      t.references :studiable, polymorphic: true

      t.timestamps
    end
    add_index :information_questions, [:studiable_id, :studiable_type]
    add_index :information_questions, :university_government_periodicity_id, name: :university_government_periodicity_id
    add_index :information_questions, :social_council_periodicity_id, name: :social_council_periodicity_id
    add_index :information_questions, :faculties_management_periodicity_id, name: :faculties_management_periodicity_id
    add_index :information_questions, :university_other_periodicity_id, name: :university_other_periodicity_id
    add_index :information_questions, :student_periodicity_id, name: :student_periodicity_id
    add_index :information_questions, :prestudent_periodicity_id, name: :prestudent_periodicity_id
    add_index :information_questions, :counselor_periodicity_id, name: :counselor_periodicity_id
    add_index :information_questions, :students_parents_periodicity_id, name: :students_parents_periodicity_id
    add_index :information_questions, :prestudents_parents_periodicity_id, name: :prestudents_parents_periodicity_id
    add_index :information_questions, :society_periodicity_id, name: :society_periodicity_id
    add_index :information_questions, :employers_periodicity_id, name: :employers_periodicity_id
    add_index :information_questions, :public_administrations_periodicity_id, name: :public_administrations_periodicity_id
  end
end
