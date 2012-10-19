# -*- encoding : utf-8 -*-
require 'spec_helper'

describe BasicQuestion do

  subject { create :basic_question }

  it { should allow_mass_assignment_of(:author) }
  it { should allow_mass_assignment_of(:population) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:year) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:year).only_integer }

  it { should belong_to(:studiable) }
end
