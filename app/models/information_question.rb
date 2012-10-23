# -*- encoding : utf-8 -*-
class InformationQuestion < ActiveRecord::Base
  INTERNAL_PUB = [
    :university_government,
    :social_council,
    :faculties_management
  ]

  INTERNAL_OTHER= [
    :university_other
  ]

  EXTERNAL_PUB = [
    :students,
    :prestudent,
    :counselor,
    :students_parents,
    :prestudents_parents,
    :society,
    :employers,
    :public_administrations
  ]

  EXTERNAL_OTHER = [
    :external_other
  ]

  FIELDS =  INTERNAL_PUB |
            INTERNAL_OTHER |
            EXTERNAL_PUB |
            EXTERNAL_OTHER

  belongs_to :university_government_periodicity, class_name: "Periodicity"
  belongs_to :social_council_periodicity, class_name: "Periodicity"
  belongs_to :faculties_management_periodicity, class_name: "Periodicity"
  belongs_to :university_other_periodicity, class_name: "Periodicity"
  belongs_to :students_periodicity, class_name: "Periodicity"
  belongs_to :prestudent_periodicity, class_name: "Periodicity"
  belongs_to :counselor_periodicity, class_name: "Periodicity"
  belongs_to :students_parents_periodicity, class_name: "Periodicity"
  belongs_to :prestudents_parents_periodicity, class_name: "Periodicity"
  belongs_to :society_periodicity, class_name: "Periodicity"
  belongs_to :employers_periodicity, class_name: "Periodicity"
  belongs_to :public_administrations_periodicity, class_name: "Periodicity"
  belongs_to :external_other_periodicity, class_name: "Periodicity"

  belongs_to :studiable, polymorphic: true

  has_one :publication_question
  accepts_nested_attributes_for :publication_question
  attr_accessible :publication_question_attributes

  def publication_question
    super || self.build_publication_question
  end

  FIELDS.each do |f|
    accepts_nested_attributes_for :"#{f}_periodicity"
    attr_accessible :"#{f}_periodicity_attributes"

    define_method(:"#{f}_periodicity") do
      super() || self.send(:"build_#{f}_periodicity")
    end
  end

  attr_accessible :counselor_check, :employers_check,
                  :external_other_check, :external_other_description,
                  :external_other_periodicity, :faculties_management_check,
                  :prestudent_check, :prestudents_parents_check,
                  :public_administrations_check, :social_council_check,
                  :society_check, :students_check, :students_parents_check,
                  :university_government_check, :university_other_check,
                  :university_other_description
end
