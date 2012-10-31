# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Service do
  subject { create :service }

  it_behaves_like "a university dependent model"
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:dependency) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:dependency) }
end
