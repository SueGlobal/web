# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ClassYear do

  subject { create :class_year }

  it { should allow_mass_assignment_of(:significant) }
  it { should allow_mass_assignment_of(:year) }

  it { should belong_to(:class_year_question) }
end
