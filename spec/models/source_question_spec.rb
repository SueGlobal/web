# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SourceQuestion do

  subject { create :source_question }

  it { should allow_mass_assignment_of(:bias) }
  it { should allow_mass_assignment_of(:data_format) }
  it { should allow_mass_assignment_of(:source) }

  it { should belong_to(:studiable) }
end
