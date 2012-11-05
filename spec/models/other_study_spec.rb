# -*- encoding : utf-8 -*-
require 'spec_helper'

describe OtherStudy do

  subject { create :other_study }

  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:notes) }

  it { should validate_presence_of(:description) }

  it_behaves_like "a study", :basic, :software,
    :funding, :information
end
