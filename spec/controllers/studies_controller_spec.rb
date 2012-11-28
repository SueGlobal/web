# -*- encoding : utf-8 -*-
require 'spec_helper'

describe StudiesController do

  def valid_session
    {}
  end

  describe "GET 'show'" do

    context "with valid type" do
      def valid_params
        {type: type}
      end

      let(:type) { :student }
      let(:valid_studies) { create_list :student_study, 3 }
      let(:not_valid_studies) { create_list :employer_study, 2 }

      before :each do
        valid_studies
        not_valid_studies
        get 'show', valid_params, valid_session
      end

      it "sets @type to params[:type]" do
        expect(assigns(:type)).to eql(type.to_s)
      end

      it "assigns the valid studies to studies" do
        expect(assigns(:studies).size).to eql(valid_studies.size)
        valid_studies.each do |study|
          expect(assigns(:studies)).to include(study)
        end
      end

      it "does not include any other kind" do
        not_valid_studies.each do |study|
          expect(assigns(:studies)).not_to include(study)
        end
      end

      it "renders 'show'" do
        expect(response).to render_template('show')
      end
    end


    context "with not valid type" do
      def valid_params
        {type: :not_valid}
      end

      before :each do
        controller.should_receive(:select_by_type).with(any_args).and_return nil
        get :show, valid_params, valid_session
      end

      it "should redirect to root" do
        expect(response).to redirect_to(root_path)
      end

      it "should set the flash" do
        expect(flash.alert).not_to be_nil
      end
    end
  end

end
