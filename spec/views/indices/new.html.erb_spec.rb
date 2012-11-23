require 'spec_helper'

describe "indices/new" do
  before(:each) do
    view.lookup_context.prefixes << "application"
    assign(:index, stub_model(Index).as_new_record)
  end

  it "renders new index form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => indices_path, :method => "post" do
    end
  end
end
