require 'spec_helper'

describe "sources/index" do
  before(:each) do
    assign(:sources, [
      stub_model(Source),
      stub_model(Source)
    ])
  end

  it "renders a list of sources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
