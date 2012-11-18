require 'spec_helper'

describe "Announcements" do
  describe "GET /announcements" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit announcements_path
      expect(current_path).to eq(root_path)
    end
  end
end
