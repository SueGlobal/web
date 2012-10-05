# -*- encoding : utf-8 -*-
require 'spec_helper'

describe GeneralFrame do

  subject { create :general_frame }
  it { should allow_mass_assignment_of(:bachelors_degree_graduates) }
  it { should allow_mass_assignment_of(:degree_graduates) }
  it { should allow_mass_assignment_of(:graduates) }
  it { should allow_mass_assignment_of(:master_graduates) }
  it { should allow_mass_assignment_of(:number_of_campus) }
  it { should allow_mass_assignment_of(:number_of_masters_degree) }
  it { should allow_mass_assignment_of(:number_of_qualifications) }
  it { should allow_mass_assignment_of(:specific_qualifications_graduates) }
  it { should allow_mass_assignment_of(:phd_graduates) }
  it { should allow_mass_assignment_of(:number_of_specific_qualifications) }
  it { should allow_mass_assignment_of(:number_of_phds) }
  it { should allow_mass_assignment_of(:year) }

  it { should validate_numericality_of(:bachelors_degree_graduates).only_integer }
  it { should validate_numericality_of(:degree_graduates).only_integer }
  it { should validate_numericality_of(:graduates).only_integer }
  it { should validate_numericality_of(:master_graduates).only_integer }
  it { should validate_numericality_of(:number_of_campus).only_integer }
  it { should validate_numericality_of(:number_of_masters_degree).only_integer }
  it { should validate_numericality_of(:number_of_qualifications).only_integer }
  it { should validate_numericality_of(:number_of_specific_qualifications).only_integer }
  it { should validate_numericality_of(:number_of_phds).only_integer }
  it { should validate_numericality_of(:specific_qualifications_graduates).only_integer }
  it { should validate_numericality_of(:phd_graduates).only_integer }
  it { should validate_numericality_of(:year).only_integer }
end
