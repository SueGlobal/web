# -*- encoding : utf-8 -*-
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121017214056) do

  create_table "achieved_activities", :force => true do |t|
    t.boolean  "studies_on_students"
    t.boolean  "external_practices"
    t.boolean  "internal_practices"
    t.boolean  "labor_orientation"
    t.boolean  "employment_agency"
    t.boolean  "external_colaborations"
    t.boolean  "research_projects"
    t.boolean  "international_dimension"
    t.text     "other_activities"
    t.boolean  "includes_studies_on_students"
    t.boolean  "includes_studies_on_employers"
    t.boolean  "includes_public_secondary_sources"
    t.boolean  "includes_non_public_secondary_sources"
    t.string   "includes_university_databases"
    t.boolean  "includes_other_studies"
    t.integer  "university_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "year"
  end

  create_table "general_frames", :force => true do |t|
    t.integer  "year"
    t.integer  "degree_graduates"
    t.integer  "bachelors_degree_graduates"
    t.integer  "graduates"
    t.integer  "master_graduates"
    t.integer  "number_of_campus"
    t.integer  "number_of_qualifications"
    t.integer  "number_of_masters_degree"
    t.integer  "university_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "specific_qualifications_graduates"
    t.integer  "phd_graduates"
    t.integer  "number_of_specific_qualifications"
    t.integer  "number_of_phds"
  end

  add_index "general_frames", ["university_id"], :name => "index_general_frames_on_university_id"
  add_index "general_frames", ["year"], :name => "index_general_frames_on_year"

  create_table "provinces", :force => true do |t|
    t.integer  "id_prov",    :null => false
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "dependency"
    t.integer  "university_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "services", ["university_id"], :name => "index_services_on_university_id"

  create_table "software_questions", :force => true do |t|
    t.boolean  "uses_some"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "province_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "universities", ["abbreviation"], :name => "index_universities_on_abbreviation", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "roles_mask",                      :default => 0
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer  "failed_logins_count",             :default => 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.integer  "university_id"
  end

  add_index "users", ["activation_token"], :name => "index_users_on_activation_token"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"
  add_index "users", ["university_id"], :name => "index_users_on_university_id"

end
