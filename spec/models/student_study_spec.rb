# -*- encoding : utf-8 -*-
require 'spec_helper'

describe StudentStudy do

  subject { create :student_study }

  StudentStudy::PARTICIPATES[:intern].each do |participation|
    it { should allow_mass_assignment_of(participation) }
  end
  StudentStudy::PARTICIPATES[:extern].each do |participation|
    it { should allow_mass_assignment_of(participation) }
  end
  StudentStudy::PARTICIPATES[:other].each do |participation|
    it { should allow_mass_assignment_of(participation) }
  end

  StudentStudy::VARIABLES.each do |var|
    it { should allow_mass_assignment_of(var) }
  end

  it { should allow_mass_assignment_of(:notes) }
  it { should allow_mass_assignment_of(:questionnaire_link) }
  it { should allow_mass_assignment_of(:reference_period) }

  it { should have_one(:software_question) }
  it { should have_one(:basic_question) }
end