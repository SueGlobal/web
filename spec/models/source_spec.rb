# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Source do

  subject { create :source }

  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:uri) }
  it { should_not allow_mass_assignment_of(:slug) }

  it { should validate_presence_of(:name) }

  it { should have_many(:indices).order('name ASC') }
end
