require 'spec_helper'

describe InformationQuestion do

  subject { create :information_question }


  InformationQuestion::FIELDS.each do |field|
    it { should allow_mass_assignment_of(:"#{field}_check") }
    it { should allow_mass_assignment_of(:"#{field}_periodicity_attributes") }

    it { should belong_to(:"#{field}_periodicity") }

    it { should accept_nested_attributes_for(:"#{field}_periodicity") }
  end

  it { should belong_to(:studiable) }
end
