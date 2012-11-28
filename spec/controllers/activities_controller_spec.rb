# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ActivitiesController do

  describe "GET 'search'" do
    before :each do
      get :search, {}, {}
    end

    it "assigns a new query object to @query" do
      expect(assigns(:query)).to be_a(ActivityQuery)
    end

    it "renders 'search'" do
      expect(response).to render_template('search')
    end
  end

  describe "GET 'retrieve'" do
    def valid_attributes
      {'these' => 'params'}
    end

    before :each do
      controller.should_receive(:query_by).with(valid_attributes).and_return(mock_query)
      post 'retrieve', {activity_query: valid_attributes}, {}
    end

    context "when it finds any university" do
      let(:mock_query) do
        mock(ActivityQuery).tap do |m|
          m.should_receive(:universities).and_return([mock(University)])
        end
      end


      it "assigns a @query object" do
        expect(assigns(:query)).to eql(mock_query)
      end

      it "assigns some universities to @universities" do
        expect(assigns(:universities)).not_to be_empty
      end

      it "renders a list of universities" do
        expect(response).to render_template('universities/index')
      end
    end

    context "when it finds no university" do

      let(:mock_query) do
        mock(ActivityQuery).tap do |m|
          m.should_receive(:universities).and_return([])
        end
      end

      it "assigns a @query object" do
        expect(assigns(:query)).to eql(mock_query)
      end

      it "renders search template" do
        expect(response).to render_template('search')
      end

      it "sets an alert" do
        expect(flash.alert).not_to be_blank
      end
    end
  end
end
