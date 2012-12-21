require 'spec_helper'

describe "journals/show" do
  before(:each) do
    @journal = assign(:journal, stub_model(Journal))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
