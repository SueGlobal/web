require 'spec_helper'

describe InformationQuestion do

  describe "attributes, associations and such" do
    before :all do
      @subject = create :information_question
    end

    # subject { create :information_question }

    subject { @subject }

    InformationQuestion::FIELDS.each do |field|
      it { should allow_mass_assignment_of(:"#{field}_check") }
      it { should allow_mass_assignment_of(:"#{field}_periodicity_attributes") }

      it { should belong_to(:"#{field}_periodicity") }

      it { should accept_nested_attributes_for(:"#{field}_periodicity") }
    end

    it { should have_one(:publication_question) }
    it { should accept_nested_attributes_for(:publication_question) }
    it { should allow_mass_assignment_of(:publication_question_attributes) }
    it { should belong_to(:studiable) }
  end
end
