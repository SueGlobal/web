# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121218133432) do

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
    t.boolean  "includes_other_studies"
    t.integer  "university_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "year"
    t.boolean  "includes_university_databases"
    t.string   "slug"
    t.boolean  "entrepreneur_advising"
    t.boolean  "formation_for_employement"
  end

  add_index "achieved_activities", ["slug"], :name => "index_achieved_activities_on_slug", :unique => true

  create_table "agreement_source_studies", :force => true do |t|
    t.boolean  "variable_pes_insertion"
    t.boolean  "variable_pes_contract_type"
    t.boolean  "variable_pes_cno"
    t.boolean  "variable_pes_municipality"
    t.boolean  "variable_pes_init_contract_date"
    t.boolean  "variable_pes_end_contract_date"
    t.boolean  "variable_pes_number_of_workers"
    t.boolean  "variable_pes_number_of_workers_last_contract"
    t.boolean  "variable_pes_cnae"
    t.boolean  "variable_pes_cnae_2009"
    t.boolean  "variable_pes_other_check"
    t.text     "variable_pes_other"
    t.boolean  "variable_jd_unemployment"
    t.boolean  "variable_jd_demand_ocupation"
    t.boolean  "variable_jd_unemployment_duration"
    t.boolean  "variable_jd_long_time_unemployed"
    t.boolean  "variable_jd_demand_activity"
    t.boolean  "variable_jd_demand_activity_2009"
    t.boolean  "variable_jd_unemployment_benefit"
    t.boolean  "variable_jd_index"
    t.boolean  "variable_jd_other_check"
    t.text     "variable_jd_other"
    t.boolean  "variable_ss_working_life"
    t.boolean  "variable_ss_crossing_date"
    t.boolean  "variable_ss_user_id"
    t.boolean  "variable_ss_ss_number"
    t.boolean  "variable_ss_birth_date"
    t.boolean  "variable_ss_cif"
    t.boolean  "variable_ss_contribution_type"
    t.boolean  "variable_ss_firm_name"
    t.boolean  "variable_ss_registration_date"
    t.boolean  "variable_ss_discharge_date"
    t.boolean  "variable_ss_total_days"
    t.boolean  "variable_ss_ctp"
    t.boolean  "variable_ss_special_regime_type"
    t.boolean  "variable_ss_other_check"
    t.text     "variable_ss_other"
    t.boolean  "variable_other_check"
    t.text     "variable_other"
    t.integer  "university_id"
    t.text     "notes"
    t.text     "slug"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.text     "agreement_signers"
    t.text     "agreement_transience"
  end

  add_index "agreement_source_studies", ["slug"], :name => "index_agreement_source_studies_on_slug", :unique => true
  add_index "agreement_source_studies", ["university_id"], :name => "index_agreement_source_studies_on_university_id"

  create_table "announcements", :force => true do |t|
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "basic_questions", :force => true do |t|
    t.text     "title"
    t.text     "author"
    t.integer  "year"
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "basic_questions", ["studiable_id", "studiable_type"], :name => "index_basic_questions_on_studiable_id_and_studiable_type"

  create_table "class_year_questions", :force => true do |t|
    t.string   "time_from_graduation_type"
    t.text     "time_from_graduation_other"
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "class_year_questions", ["studiable_id", "studiable_type"], :name => "index_class_year_questions_on_studiable_id_and_studiable_type"

  create_table "class_years", :force => true do |t|
    t.integer  "year"
    t.boolean  "significant"
    t.integer  "class_year_question_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "class_years", ["class_year_question_id"], :name => "index_class_years_on_class_year_question_id"

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "database_studies", :force => true do |t|
    t.integer  "university_id"
    t.text     "description"
    t.text     "database"
    t.text     "variables"
    t.text     "producer"
    t.text     "analyzer"
    t.text     "notes"
    t.text     "slug"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "database_studies", ["slug"], :name => "index_database_studies_on_slug", :unique => true
  add_index "database_studies", ["university_id"], :name => "index_database_studies_on_university_id"

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.string   "file"
    t.string   "slug"
    t.boolean  "published"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "documents", ["published"], :name => "index_documents_on_published"
  add_index "documents", ["slug"], :name => "index_documents_on_slug"
  add_index "documents", ["type"], :name => "index_documents_on_type"

  create_table "employer_studies", :force => true do |t|
    t.boolean  "variable_selection_process"
    t.boolean  "variable_extra_experience"
    t.boolean  "variable_offer_requirements"
    t.boolean  "variable_contract_characteristics"
    t.boolean  "variable_knowledge_evaluation"
    t.boolean  "variable_competence_evaluation"
    t.text     "variable_other"
    t.boolean  "segmentation_variable_activity_sector"
    t.boolean  "segmentation_variable_organization_size"
    t.boolean  "segmentation_variable_companies_using_ues"
    t.boolean  "segmentation_variable_companies_hiring_graduates"
    t.text     "segmentation_variable_others"
    t.boolean  "segmentation_variable_no_segmentation"
    t.string   "slug",                                             :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "university_id"
    t.boolean  "segmentation_variable_others_check"
    t.boolean  "variable_other_check"
    t.text     "notes"
  end

  add_index "employer_studies", ["slug"], :name => "index_employer_studies_on_slug"
  add_index "employer_studies", ["university_id"], :name => "index_employer_studies_on_university_id"

  create_table "field_work_questions", :force => true do |t|
    t.boolean  "phone"
    t.boolean  "email"
    t.boolean  "internet"
    t.boolean  "mail"
    t.boolean  "interview"
    t.boolean  "focus_group"
    t.text     "other"
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "questionnaire_link"
    t.boolean  "other_check"
  end

  add_index "field_work_questions", ["studiable_id", "studiable_type"], :name => "index_field_work_questions_on_studiable_id_and_studiable_type"

  create_table "funding_questions", :force => true do |t|
    t.boolean  "fixed_state_funding"
    t.boolean  "variable_state_funding"
    t.boolean  "fixed_private_funding"
    t.boolean  "variable_private_funding"
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "funding_questions", ["studiable_id", "studiable_type"], :name => "index_funding_questions_on_studiable_id_and_studiable_type"
  add_index "funding_questions", ["studiable_id"], :name => "index_funding_questions_on_studiable_id"

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
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "specific_qualifications_graduates"
    t.integer  "phd_graduates"
    t.integer  "number_of_specific_qualifications"
    t.integer  "number_of_phds"
    t.boolean  "bachelors_degree_graduates_check"
    t.boolean  "degree_graduates_check"
    t.boolean  "graduates_check"
    t.boolean  "master_graduates_check"
    t.boolean  "number_of_campus_check"
    t.boolean  "number_of_masters_degree_check"
    t.boolean  "number_of_qualifications_check"
    t.boolean  "year_check"
    t.boolean  "phd_graduates_check"
    t.boolean  "specific_qualifications_graduates_check"
    t.boolean  "number_of_phds_check"
    t.boolean  "number_of_specific_qualifications_check"
    t.string   "slug"
    t.integer  "number_of_degrees"
    t.boolean  "number_of_degrees_check"
    t.integer  "number_of_bachelor_degrees"
    t.boolean  "number_of_bachelor_degrees_check"
  end

  add_index "general_frames", ["slug"], :name => "index_general_frames_on_slug", :unique => true
  add_index "general_frames", ["university_id"], :name => "index_general_frames_on_university_id"
  add_index "general_frames", ["year"], :name => "index_general_frames_on_year"

  create_table "index_confirmations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "index_id"
    t.boolean  "accepted"
    t.datetime "accepted_at"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "index_confirmations", ["index_id"], :name => "index_index_confirmations_on_index_id"
  add_index "index_confirmations", ["slug"], :name => "index_index_confirmations_on_slug"
  add_index "index_confirmations", ["user_id"], :name => "index_index_confirmations_on_user_id"

  create_table "index_descriptions", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "index_details", :force => true do |t|
    t.integer  "index_level_id"
    t.integer  "periodicity_id"
    t.integer  "source_id"
    t.text     "methodology_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "index_details", ["index_level_id"], :name => "index_index_details_on_index_level_id"
  add_index "index_details", ["periodicity_id"], :name => "index_index_details_on_periodicity_id"
  add_index "index_details", ["source_id"], :name => "index_index_details_on_source_id"

  create_table "index_levels", :force => true do |t|
    t.string   "toplevel"
    t.string   "sublevel"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "index_levels", ["toplevel", "sublevel"], :name => "index_index_levels_on_toplevel_and_sublevel"
  add_index "index_levels", ["toplevel"], :name => "index_index_levels_on_toplevel"

  create_table "index_segments", :force => true do |t|
    t.integer  "index_id"
    t.integer  "segment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "index_segments", ["index_id"], :name => "index_index_segments_on_index_id"
  add_index "index_segments", ["segment_id"], :name => "index_index_segments_on_segment_id"

  create_table "indices", :force => true do |t|
    t.string   "slug"
    t.text     "name"
    t.text     "description"
    t.integer  "source_id"
    t.integer  "periodicity_id"
    t.text     "methodology_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "root"
    t.integer  "parent_id"
    t.boolean  "confirmed"
  end

  add_index "indices", ["confirmed"], :name => "index_indices_on_confirmed"
  add_index "indices", ["parent_id"], :name => "index_indices_on_parent_id"
  add_index "indices", ["periodicity_id"], :name => "index_indices_on_periodicity_id"
  add_index "indices", ["root"], :name => "index_indices_on_informative"
  add_index "indices", ["slug"], :name => "index_indices_on_slug", :unique => true
  add_index "indices", ["source_id"], :name => "index_indices_on_source_id"

  create_table "information_questions", :force => true do |t|
    t.boolean  "university_government_check"
    t.integer  "university_government_periodicity_id"
    t.boolean  "social_council_check"
    t.integer  "social_council_periodicity_id"
    t.boolean  "faculties_management_check"
    t.integer  "faculties_management_periodicity_id"
    t.boolean  "university_other_check"
    t.integer  "university_other_periodicity_id"
    t.text     "university_other_description"
    t.boolean  "students_check"
    t.integer  "students_periodicity_id"
    t.boolean  "prestudent_check"
    t.integer  "prestudent_periodicity_id"
    t.boolean  "counselor_check"
    t.integer  "counselor_periodicity_id"
    t.boolean  "students_parents_check"
    t.integer  "students_parents_periodicity_id"
    t.boolean  "prestudents_parents_check"
    t.integer  "prestudents_parents_periodicity_id"
    t.boolean  "society_check"
    t.integer  "society_periodicity_id"
    t.boolean  "employers_check"
    t.integer  "employers_periodicity_id"
    t.boolean  "public_administrations_check"
    t.integer  "public_administrations_periodicity_id"
    t.boolean  "external_other_check"
    t.integer  "external_other_periodicity_id"
    t.text     "external_other_description"
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "information_questions", ["counselor_periodicity_id"], :name => "counselor_periodicity_id"
  add_index "information_questions", ["employers_periodicity_id"], :name => "employers_periodicity_id"
  add_index "information_questions", ["faculties_management_periodicity_id"], :name => "faculties_management_periodicity_id"
  add_index "information_questions", ["prestudent_periodicity_id"], :name => "prestudent_periodicity_id"
  add_index "information_questions", ["prestudents_parents_periodicity_id"], :name => "prestudents_parents_periodicity_id"
  add_index "information_questions", ["public_administrations_periodicity_id"], :name => "public_administrations_periodicity_id"
  add_index "information_questions", ["social_council_periodicity_id"], :name => "social_council_periodicity_id"
  add_index "information_questions", ["society_periodicity_id"], :name => "society_periodicity_id"
  add_index "information_questions", ["students_parents_periodicity_id"], :name => "students_parents_periodicity_id"
  add_index "information_questions", ["students_periodicity_id"], :name => "student_periodicity_id"
  add_index "information_questions", ["studiable_id", "studiable_type"], :name => "index_information_questions_on_studiable_id_and_studiable_type"
  add_index "information_questions", ["university_government_periodicity_id"], :name => "university_government_periodicity_id"
  add_index "information_questions", ["university_other_periodicity_id"], :name => "university_other_periodicity_id"

  create_table "other_studies", :force => true do |t|
    t.text     "description"
    t.text     "notes"
    t.integer  "university_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "slug"
  end

  add_index "other_studies", ["slug"], :name => "index_other_studies_on_slug"
  add_index "other_studies", ["university_id"], :name => "index_other_studies_on_university_id"

  create_table "periodicities", :force => true do |t|
    t.string   "periodicity_type"
    t.text     "other_description"
    t.integer  "periodic_id"
    t.string   "periodic_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "periodicities", ["periodic_id", "periodic_type"], :name => "index_periodicities_on_periodic_id_and_periodic_type"

  create_table "provinces", :force => true do |t|
    t.integer  "id_prov",    :null => false
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "public_source_studies", :force => true do |t|
    t.integer  "university_id"
    t.text     "slug"
    t.text     "variables"
    t.text     "notes"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "population"
  end

  add_index "public_source_studies", ["slug"], :name => "index_public_source_studies_on_slug", :unique => true
  add_index "public_source_studies", ["university_id"], :name => "index_public_source_studies_on_university_id"

  create_table "publication_questions", :force => true do |t|
    t.integer  "information_question_id"
    t.boolean  "with_isbn_check"
    t.boolean  "without_isbn_check"
    t.boolean  "limited_distribution_check"
    t.boolean  "static_web_check"
    t.text     "static_web_url"
    t.boolean  "dynamic_web_check"
    t.text     "dynamic_web_url"
    t.boolean  "pdf_check"
    t.boolean  "multimedia_check"
    t.boolean  "app_check"
    t.boolean  "papers_check"
    t.boolean  "thesis_check"
    t.boolean  "other_check"
    t.text     "other"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "publication_questions", ["information_question_id"], :name => "index_publication_questions_on_information_question_id"

  create_table "sample_questions", :force => true do |t|
    t.text     "scope"
    t.text     "population"
    t.string   "sampling_option"
    t.text     "non_probabilistic_description"
    t.text     "sampling_type"
    t.text     "disintegration_level"
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "sample_questions", ["studiable_id", "studiable_type"], :name => "index_sample_questions_on_studiable_id_and_studiable_type"

  create_table "sample_values", :force => true do |t|
    t.integer  "value_in_cents"
    t.integer  "sample_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "sample_values", ["sample_id"], :name => "index_sample_values_on_sample_id"

  create_table "sample_values_segmentation_variable_values", :id => false, :force => true do |t|
    t.integer "sample_value_id"
    t.integer "segmentation_variable_value_id"
  end

  add_index "sample_values_segmentation_variable_values", ["sample_value_id"], :name => "index_for_sample_values_to_segmentation_variable_values"

  create_table "samples", :force => true do |t|
    t.integer  "index_id"
    t.datetime "taken_at"
    t.integer  "periodicity_id"
    t.integer  "source_id"
    t.text     "methodology_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
  end

  add_index "samples", ["index_id"], :name => "index_samples_on_index_id"
  add_index "samples", ["periodicity_id"], :name => "index_samples_on_periodicity_id"
  add_index "samples", ["slug"], :name => "index_samples_on_slug", :unique => true

  create_table "samples_segments", :id => false, :force => true do |t|
    t.integer "sample_id",  :null => false
    t.integer "segment_id", :null => false
  end

  add_index "samples_segments", ["sample_id", "segment_id"], :name => "index_samples_segments_on_sample_id_and_segment_id", :unique => true

  create_table "segmentation_variable_values", :force => true do |t|
    t.string   "value"
    t.integer  "segmentation_variable_id"
    t.integer  "order"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "segmentation_variable_values", ["segmentation_variable_id"], :name => "index_segmentation_variable_values_on_segmentation_variable_id"

  create_table "segmentation_variable_values_segments", :force => true do |t|
    t.integer "segment_id"
    t.integer "segmentation_variable_value_id"
  end

  add_index "segmentation_variable_values_segments", ["segment_id"], :name => "segments_to_values_segment_id"
  add_index "segmentation_variable_values_segments", ["segmentation_variable_value_id"], :name => "segments_to_values_value_id"

  create_table "segmentation_variables", :force => true do |t|
    t.string   "slug"
    t.text     "name"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "segmentation_variable_values_count", :default => 0
  end

  create_table "segments", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "segmentation_variable_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "segments", ["segmentation_variable_id"], :name => "index_segments_on_segmentation_variable_id"
  add_index "segments", ["slug"], :name => "index_segments_on_slug"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "dependency"
    t.integer  "university_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "slug"
  end

  add_index "services", ["name"], :name => "index_services_on_name"
  add_index "services", ["slug"], :name => "index_services_on_slug", :unique => true
  add_index "services", ["university_id"], :name => "index_services_on_university_id"

  create_table "software_questions", :force => true do |t|
    t.boolean  "uses_some"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "studiable_id"
    t.string   "studiable_type"
  end

  add_index "software_questions", ["studiable_id", "studiable_type"], :name => "index_software_questions_on_studiable_id_and_studiable_type"

  create_table "source_questions", :force => true do |t|
    t.text     "source"
    t.text     "bias"
    t.text     "data_format"
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "source_questions", ["studiable_id", "studiable_type"], :name => "index_source_questions_on_studiable_id_and_studiable_type"

  create_table "sources", :force => true do |t|
    t.string   "slug"
    t.text     "name"
    t.text     "uri"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sources", ["slug"], :name => "index_sources_on_slug"

  create_table "student_studies", :force => true do |t|
    t.text     "scope"
    t.boolean  "participates_employment_agency"
    t.boolean  "participates_quality_area"
    t.boolean  "participates_university_department"
    t.boolean  "participates_foundation"
    t.boolean  "participates_aneca"
    t.boolean  "participates_state_organization"
    t.boolean  "participates_chamber_of_commerce"
    t.boolean  "participates_state_employment_agency"
    t.boolean  "participates_employers_association"
    t.boolean  "participates_companies"
    t.boolean  "participates_european_institutions"
    t.boolean  "participates_labor_unions"
    t.boolean  "participates_professional_associations"
    t.text     "reference_period"
    t.boolean  "variable_graduate_profile"
    t.boolean  "variable_complementary_activities"
    t.boolean  "variable_satisfaction"
    t.boolean  "variable_job_hunting"
    t.boolean  "variable_study_job_compatibility"
    t.boolean  "variable_first_job"
    t.boolean  "variable_employees"
    t.boolean  "variable_self_employees"
    t.boolean  "variable_contract_type"
    t.boolean  "variable_current_job"
    t.boolean  "variable_employee_situation"
    t.boolean  "variable_knowledge_valuation"
    t.boolean  "variable_competence_valuation"
    t.text     "variable_other"
    t.text     "notes"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "participates_other_universities"
    t.integer  "university_id"
    t.boolean  "variable_other_check"
    t.string   "slug"
    t.boolean  "variable_job_satisfaction"
    t.text     "participates_internal_other"
    t.boolean  "participates_internal_other_check"
    t.text     "participates_external_other"
    t.boolean  "participates_external_other_check"
  end

  add_index "student_studies", ["slug"], :name => "index_student_studies_on_slug", :unique => true
  add_index "student_studies", ["university_id"], :name => "index_student_studies_on_university_id"

  create_table "study_periodicity_questions", :force => true do |t|
    t.integer  "studiable_id"
    t.string   "studiable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "periodicity_id"
  end

  add_index "study_periodicity_questions", ["periodicity_id"], :name => "index_study_periodicity_questions_on_periodicity_id"
  add_index "study_periodicity_questions", ["studiable_id", "studiable_type"], :name => "index_study_periodicity_on_studiable"

  create_table "universities", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.integer  "community_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "slug"
    t.string   "name_for_order"
  end

  add_index "universities", ["abbreviation"], :name => "index_universities_on_abbreviation", :unique => true
  add_index "universities", ["name_for_order"], :name => "index_universities_on_name_for_order"
  add_index "universities", ["slug"], :name => "index_universities_on_slug", :unique => true

  create_table "university_change_requests", :force => true do |t|
    t.integer  "university_id"
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "state"
    t.integer  "previous_university_id"
  end

  add_index "university_change_requests", ["previous_university_id"], :name => "index_university_change_requests_on_previous_university_id"
  add_index "university_change_requests", ["state"], :name => "index_university_change_requests_on_state"
  add_index "university_change_requests", ["token"], :name => "index_university_change_requests_on_token"
  add_index "university_change_requests", ["university_id"], :name => "index_university_change_requests_on_university_id"
  add_index "university_change_requests", ["user_id"], :name => "index_university_change_requests_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
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
    t.string   "locale",                          :default => "es"
  end

  add_index "users", ["activation_token"], :name => "index_users_on_activation_token"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"
  add_index "users", ["university_id"], :name => "index_users_on_university_id"

end
