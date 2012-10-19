# -*- encoding : utf-8 -*-
shared_examples "has basic questions" do
  it { should allow_mass_assignment_of(:basic_question_attributes) }
  it { should have_one(:basic_question) }
end
