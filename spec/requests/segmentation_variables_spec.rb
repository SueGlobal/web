# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "SegmentationVariables" do
  before :each do
    login_with email, password, false if email && password
  end
  describe "GET /segmentation_variables" do
  end

  describe "GET /segmentation_variables/new" do
    let(:password) { "123456" }
    let(:user) { create :user, :active, :admin, password: password }
    let(:email) { user.email }

    before :each do
      visit new_segmentation_variable_path
    end

    it "has one segmentation_variable_value visible"  do

      expect(page).to have_selector('div.segmentation_variable_value', visible: true,  count: 1)
      expect(page).to have_selector('a.remove_segmentation_variable_value', count: 1)
      expect(page).to have_selector('a.add_fields')
    end

    it "adds more segmentation variable values",  :js => true do
      page.find('a.add_fields').click
      page.find('a.add_fields').click
      expect(page).to have_selector(variable_value, visible: true, count: 3)
    end

  end

  describe "GET /segmentation_variables/:id/edit" do
    let(:password) { "123456" }
    let(:user) { create :user, :active, :admin, password: password }
    let(:email) { user.email }
    let!(:variable) { create :segmentation_variable, value_count: 3 }

    before :each do
      visit edit_segmentation_variable_path(variable)
    end

    it "shows no link" do
      expect(page).to have_no_css('a.add_fields')
      expect(page).to have_css('a.remove_segmentation_variable_value', visible: false, count: 3)
    end
  end

  def variable_value opts={}
    'div.segmentation_variable_value'
  end

  def add_field_button
    find('a.add_fields')
  end
end
