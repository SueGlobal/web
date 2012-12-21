require 'spec_helper'

describe "journals/index" do
  before(:each) do
    assign(:journals, [
      stub_model(Journal),
      stub_model(Journal)
    ])
  end

  it "renders a list of journals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
