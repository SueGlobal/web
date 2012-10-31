shared_examples "a study" do |*questions|

  it_behaves_like "a university dependent model"

  it_behaves_like "has questions", *questions
end
