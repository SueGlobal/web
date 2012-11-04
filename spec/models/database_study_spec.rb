# -*- encoding : utf-8 -*-
require 'spec_helper'

describe DatabaseStudy do

  subject { create :database_study }

  it { should allow_mass_assignment_of(:analyzer) }
  it { should allow_mass_assignment_of(:database) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:notes) }
  it { should allow_mass_assignment_of(:producer) }
  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:variables) }

  it { should validate_presence_of(:description) }

  it_behaves_like "a study", :basic, :software,
    :funding, :information
end
