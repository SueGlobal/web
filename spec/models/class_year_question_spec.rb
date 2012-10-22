# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ClassYearQuestion do

  subject { create :class_year_question }

  it { should allow_mass_assignment_of(:time_from_graduation_type) }
  it { should allow_mass_assignment_of(:time_from_graduation_other) }
  it { should allow_mass_assignment_of(:class_years_attributes) }

  it { should belong_to(:studiable) }
  it { should have_many(:class_years) }

  it { should accept_nested_attributes_for(:class_years).allow_destroy(true) }
end
