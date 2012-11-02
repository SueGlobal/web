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
    it { should allow_mass_assignment_of("#{participation}_check") }
  end

  StudentStudy::VARIABLES.each do |var|
    it { should allow_mass_assignment_of(var) }
  end

  StudentStudy::VARIABLES_OTHER.each do |var|
    it { should allow_mass_assignment_of(var) }
    it { should allow_mass_assignment_of("#{var}_check") }
  end

  it { should allow_mass_assignment_of(:notes) }
  it { should allow_mass_assignment_of(:reference_period) }
  it { should allow_mass_assignment_of(:scope) }

  it_behaves_like "a study", :basic, :software, :sample, :funding,
    :field_work, :study_periodicity, :class_year, :information
end
