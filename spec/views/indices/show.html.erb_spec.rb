require 'spec_helper'

describe "indices/show" do
  before(:each) do
    view.lookup_context.prefixes << "application"
    @index = assign(:index, IndexDecorator.decorate(create :index))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
