# -*- encoding : utf-8 -*-
shared_examples "has questions" do |*types|

  types.each do |type|
    it { should allow_mass_assignment_of(:"#{type}_question_attributes") }
    it { should have_one(:"#{type}_question") }
    it { should accept_nested_attributes_for(:"#{type}_question") }
  end
end
