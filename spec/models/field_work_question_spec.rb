# -*- encoding : utf-8 -*-
require 'spec_helper'

describe FieldWorkQuestion do

  subject { create :field_work_question }

  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:focus_group) }
  it { should allow_mass_assignment_of(:internet) }
  it { should allow_mass_assignment_of(:interview) }
  it { should allow_mass_assignment_of(:mail) }
  it { should allow_mass_assignment_of(:phone) }
  it { should allow_mass_assignment_of(:other) }

  it { should belong_to(:studiable) }
end
