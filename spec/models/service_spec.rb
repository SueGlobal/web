require 'spec_helper'

describe Service do
  subject { create :service }

  it { should belong_to(:university) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:dependency) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:dependency) }
end