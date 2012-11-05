# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PublicSourceStudy do

  subject { create :public_source_study }

  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:variables) }
  it { should allow_mass_assignment_of(:notes) }
  it { should allow_mass_assignment_of(:population) }

  it_behaves_like "a study", :basic, :class_year,
    :funding, :information, :software, :source
end
