class CreateFieldWorkQuestions < ActiveRecord::Migration
  def change
    create_table :field_work_questions do |t|
      t.boolean :phone
      t.boolean :email
      t.boolean :internet
      t.boolean :mail
      t.boolean :interview
      t.boolean :focus_group
      t.text :other
      t.references :studiable, polymorphic: true

      t.timestamps
    end
  end
end
