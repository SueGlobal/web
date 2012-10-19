# -*- encoding : utf-8 -*-
shared_examples "has software questions" do
  it { should allow_mass_assignment_of(:software_question_attributes) }
  it { should have_one(:software_question) }
end
