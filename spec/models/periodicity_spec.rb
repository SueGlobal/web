# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Periodicity do

  subject { create :periodicity }

  it { should allow_mass_assignment_of(:periodicity_type) }
  it { should allow_mass_assignment_of(:other_description) }
end
