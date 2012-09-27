require 'spec_helper'

describe "universities/index" do
  before(:each) do
    assign(:universities, [
      stub_model(University),
      stub_model(University)
    ])
  end

  it "renders a list of universities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
