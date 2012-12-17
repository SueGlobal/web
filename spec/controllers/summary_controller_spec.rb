require 'spec_helper'

describe SummaryController do

  def valid_session
    {}
  end

  describe "GET 'index'" do
    before :each do
      get :index, valid_params, valid_session
    end
    context "without params" do
      let(:valid_params) { Hash.new }

      it "sets year to current year" do
        expect(assigns(:year)).to eql(Date.today.year)
      end

      it "renders index" do
        expect(response).to render_template('index')
      end
    end

    context "with params" do
      let(:year) { 2009 }
      let(:valid_params) { {year: year} }

      it "sets year to parameter" do
        expect(assigns(:year)).to eql(year)
      end

      it "renders index" do
        expect(response).to render_template('index')
      end
    end
  end

end
