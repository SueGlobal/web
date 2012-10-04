class CreateGeneralFrames < ActiveRecord::Migration
  def change
    create_table :general_frames do |t|
      t.integer :year
      t.integer :degree_graduates
      t.integer :bachelors_degree_graduates
      t.integer :graduates
      t.integer :master_graduates
      t.integer :number_of_campus
      t.integer :number_of_qualifications
      t.integer :number_of_masters_degree
      t.references :university

      t.timestamps
    end
    add_index :general_frames, :year
    add_index :general_frames, :university_id
  end
end
