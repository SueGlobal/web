# -*- encoding : utf-8 -*-
require 'spec_helper'

describe EmployerStudy do

  subject { create :employer_study }

  EmployerStudy::VARIABLES.each do |variable|
    it { should allow_mass_assignment_of(variable) }
  end

  EmployerStudy::VARIABLES_OTHER.each do |variable|
    it { should allow_mass_assignment_of(variable) }
    it { should allow_mass_assignment_of("#{variable}_check") }
  end

  EmployerStudy::SEGMENTATION_VARIABLES.each do |variable|
    it { should allow_mass_assignment_of(variable) }
  end

  EmployerStudy::SEGMENTATION_VARIABLES_OTHER.each do |variable|
    it { should allow_mass_assignment_of(variable) }
    it { should allow_mass_assignment_of("#{variable}_check") }
  end

  it { should allow_mass_assignment_of(:notes) }

  it_behaves_like "a study", :basic, :sample, :funding,
    :field_work, :study_periodicity, :information, :software
end
