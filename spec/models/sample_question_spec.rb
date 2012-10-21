# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SampleQuestion do

  subject { create :sample_question }

  it { should allow_mass_assignment_of(:disintegration_level) }
  it { should allow_mass_assignment_of(:non_probabilistic_description) }
  it { should allow_mass_assignment_of(:sampling_type) }
  it { should allow_mass_assignment_of(:population) }
  it { should allow_mass_assignment_of(:sampling_option) }
  it { should allow_mass_assignment_of(:scope) }
end
