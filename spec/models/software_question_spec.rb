# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SoftwareQuestion do

  subject { create :software_question }

  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:uses_some) }

  it { should belong_to(:studiable) }
end
