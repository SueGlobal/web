# -*- encoding : utf-8 -*-
require 'spec_helper'
describe SegmentsController do

  def valid_attributes
    attributes_for :segment
  end

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:var) { create :segmentation_variable }

  describe "GET new" do
    context "when no user is logged in" do
      let(:user) { nil }

      before :each do
        get :new, {segmentation_variable_id: var.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "and user can 'new' segment" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
          get :new, {segmentation_variable_id: var.to_param}, valid_session
        end

        it "assigns a new segment as @segment" do
          expect(assigns(:segment)).to be_a_new(Segment)
        end

        it "renders 'new'" do
          expect(response).to render_template('new')
        end
      end

      context "and user can 'create' segment" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          get :new, {segmentation_variable_id: var.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "POST create" do

    def post_create attrs=nil
      attrs ||= valid_attributes
      post :create,
        { segmentation_variable_id: var.to_param,
          segment: attrs},
        valid_session
    end

    context "when no user is logged in" do
      let(:user) { nil }

      before :each do
        post :create,
          {segmentation_variable_id: var.to_param, segment: valid_attributes},
          valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "and user cannot 'create' segment" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          post_create
        end

        it_behaves_like "user is not authorized"
      end

      context "and user can 'create' segments" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        describe "with valid params" do
          it "creates a new Segment" do
            expect {
              post_create
            }.to change(Segment, :count).by(1)
          end

          it "assigns a newly created segment as @segment" do
            post_create
            assigns(:segment).should be_a(Segment)
            assigns(:segment).should be_persisted
          end

          it "redirects to the created segment" do
            post_create
            response.should redirect_to(var)
          end

          it "corrects the segmentation_variable id" do
            post_create
            expect(Segment.last.segmentation_variable).to eql(var)
          end
        end

        describe "with invalid params" do
          it "assigns a newly created but unsaved segment as @segment" do
            # Trigger the behavior that occurs when invalid params are submitted
            Segment.any_instance.stub(:save).and_return(false)
            post_create
            assigns(:segment).should be_a_new(Segment)
          end

          it "re-renders the 'new' template" do
            # Trigger the behavior that occurs when invalid params are submitted
            Segment.any_instance.stub(:save).and_return(false)
            post_create
            response.should render_template("new")
          end
        end
      end
    end
  end
end
