require 'spec_helper'

describe IndexConfirmation do

  describe "attributes" do
    subject { create :index_confirmation }

    it { should_not allow_mass_assignment_of(:accepted) }
    it { should_not allow_mass_assignment_of(:accepted_at) }

    it { should belong_to(:user) }
    it { should belong_to(:index) }
  end
end
