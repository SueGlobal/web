class CreatePublicationQuestions < ActiveRecord::Migration
  def change
    create_table :publication_questions do |t|
      t.references :information_question
      t.boolean :with_isbn_check
      t.boolean :without_isbn_check
      t.boolean :limited_distribution_check
      t.boolean :static_web_check
      t.text :static_web_url
      t.boolean :dynamic_web_check
      t.text :dynamic_web_url
      t.boolean :pdf_check
      t.boolean :multimedia_check
      t.boolean :app_check
      t.boolean :papers_check
      t.boolean :thesis_check
      t.boolean :other_check
      t.text :other_description

      t.timestamps
    end
    add_index :publication_questions, :information_question_id
  end
end
