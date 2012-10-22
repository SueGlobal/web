# -*- encoding : utf-8 -*-
require 'spec_helper'

describe StudyPeriodicityQuestion do

  subject { create :study_periodicity_question }

  it { should accept_nested_attributes_for(:periodicity) }

  it { should allow_mass_assignment_of(:periodicity_attributes) }

  it { should have_one(:periodicity) }

  it { should belong_to(:studiable) }
end
