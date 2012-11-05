# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AgreementSourceStudy do

  subject { create :agreement_source_study }

  AgreementSourceStudy::VARIABLES_PES.each do |var|
    it { should allow_mass_assignment_of(var) }
  end

  AgreementSourceStudy::VARIABLES_PES_OTHER.each do |var|
    it { should allow_mass_assignment_of(var) }
    it { should allow_mass_assignment_of("#{var}_check") }
  end

  AgreementSourceStudy::VARIABLES_JD.each do |var|
    it { should allow_mass_assignment_of(var) }
  end

  AgreementSourceStudy::VARIABLES_JD_OTHER.each do |var|
    it { should allow_mass_assignment_of(var) }
    it { should allow_mass_assignment_of("#{var}_check") }
  end

  AgreementSourceStudy::VARIABLES_SS.each do |var|
    it { should allow_mass_assignment_of(var) }
  end

  AgreementSourceStudy::VARIABLES_SS_OTHER.each do |var|
    it { should allow_mass_assignment_of(var) }
    it { should allow_mass_assignment_of("#{var}_check") }
  end

  AgreementSourceStudy::VARIABLES_OTHER.each do |var|
    it { should allow_mass_assignment_of(var) }
    it { should allow_mass_assignment_of("#{var}_check") }
  end

  it { should allow_mass_assignment_of(:notes) }
  it { should allow_mass_assignment_of(:agreement_signers) }
  it { should allow_mass_assignment_of(:agreement_transience) }

  it_behaves_like "a study", :basic, :source, :class_year,
    :software, :funding, :information
end
