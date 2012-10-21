# -*- encoding : utf-8 -*-
require 'spec_helper'

describe FundingQuestion do

  subject { create :funding_question }

  it { should allow_mass_assignment_of(:fixed_state_funding) }
  it { should allow_mass_assignment_of(:variable_state_funding) }
  it { should allow_mass_assignment_of(:fixed_private_funding) }
  it { should allow_mass_assignment_of(:variable_private_funding) }

  it { should belong_to(:studiable) }
end
