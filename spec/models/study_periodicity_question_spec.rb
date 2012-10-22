require 'spec_helper'

describe StudyPeriodicityQuestion do

  subject { create :study_periodicity_question }

  it { should allow_mass_assignment_of(:other_description) }
  it { should allow_mass_assignment_of(:periodicity) }

  it { should belong_to(:studiable) }
end
