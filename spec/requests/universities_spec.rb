# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Universities" do
  describe "GET /universities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get universities_path
      response.status.should be(200)
    end
  end

  describe "creating a university" do
    let(:password) { "123456" }
    let(:user) { create :user, :active, :admin, password: password }
    let!(:communities) { create_list :community, 3 }
    before :each do
      login_with user.email, password
      visit new_university_path
    end

    context "with valid attributes" do
      let(:attrs) { attributes_for :university }

      it "should add the correct attributes" do
        within "form.new_university" do
          fill_in "university[name]", with: attrs[:name]
          fill_in "university[abbreviation]", with: attrs[:abbreviation]
          select communities.last.name, from: "university[community_id]"
          find("input[name=commit]").click
        end
        university = University.last
        expect(university.name).to eq(attrs[:name])
        expect(university.abbreviation).to eq(attrs[:abbreviation])
        expect(university.community.name).to eq(communities.last.name)
      end
    end
  end
end
