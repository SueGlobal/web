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
    let!(:user) { create :user, :active, :admin, password: password }
    let(:password) { "123456" }
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

  describe "deleting a university", js: true do
    let!(:user) { create :user, :active, :god, password: password, university: university}
    let(:password) { "123456" }
    let(:university) { create :university }

    before :each do
      login_with user.email, password
      university
      visit universities_path
    end

    it "uses the modal window and ajax" do
      within 'tr.university' do
        find('a.destroy').click
      end

      page.should have_selector('#destroy-modal', visible: true)

      within '#destroy-modal' do
          find('a.destroy').click
      end

      page.should have_no_selector('tr.university')

      expect(University.find_by_slug(university.slug)).to be_nil
    end
  end

  describe "deleting dependent models in university#show" do
    let(:password) { "123456" }
    let!(:user) { create :user, :active, :god, password: password, university: university}
    let(:university) { create :university }

    before :each do
      login_with user.email, password
    end

    shared_examples "ajax remove dependent model" do |resource_name, resource_class|
      it "uses the modal window and ajax" do
        resource = create resource_name, university: university

        visit university_path(university)

        within "li.#{resource_name}" do
          find('a.destroy').click
        end

        page.should have_selector('#destroy-modal', visible: true)

        within '#destroy-modal' do
          find('a.destroy').click
        end

        expect(page).to have_no_selector("li.#{resource_name}")

        expect(resource_class.find_by_slug(resource.slug)).to be_nil
      end
    end

    context "services" do
      include_examples "ajax remove dependent model", :service, Service
    end

    context "achieved activities" do
      include_examples "ajax remove dependent model", :achieved_activity, AchievedActivity
    end

    context "general frames" do
      include_examples "ajax remove dependent model", :general_frame, GeneralFrame
    end

    context 'student studies' do
      include_examples "ajax remove dependent model", :student_study, StudentStudy
    end

    context 'employer studies' do
      include_examples "ajax remove dependent model", :employer_study, EmployerStudy
    end

    context 'public source studies' do
      include_examples "ajax remove dependent model", :public_source_study, PublicSourceStudy
    end

    context 'agreement source studies' do
      include_examples "ajax remove dependent model", :agreement_source_study, AgreementSourceStudy
    end

    context 'database studies' do
      include_examples "ajax remove dependent model", :database_study, DatabaseStudy
    end

    context 'other studies' do
      include_examples "ajax remove dependent model", :other_study, OtherStudy
    end
  end
end
