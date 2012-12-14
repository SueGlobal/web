# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SegmentationVariablesController do

  it_behaves_like "an index related model controller", SegmentationVariable,
    :new, :edit, :create, :create_with_show

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:variable) { create :segmentation_variable }

  describe "GET index" do
    context "when there is no user" do
      let(:user) { nil }
      before(:each) do
        variable
        get :index, {}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user" do
      let(:user) { create :user, :admin }
      context "that can index variables" do

        before :each do
          controller.should_receive(:authorize!).and_return true
          variable
          get :index, {}, valid_session
        end

        it "assigns all variables as an instance variable" do
          expect(assigns(:segmentation_variables)).to eq([variable])
        end
      end

      context "that cannot index variables" do

        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          variable
          get :index, {}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "GET show" do
    context "when there is no user" do
      let(:user) { nil }

      before(:each) do
        get :show, {id: variable.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user" do
      let(:user) { create :user, :admin }

      context "can show the variable" do

        before :each do
          controller.should_receive(:authorize!).and_return true
          get :show, {id: variable.to_param}, valid_session
        end

        it "assigns the variable as an instance variable" do
          expect(assigns(:segmentation_variable)).to eq(variable)
        end

        it "renders the show template" do
          expect(response).to render_template('show')
        end
      end

      context "cannot show the variable" do

        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          get :show, {id: variable.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "PUT update" do
    def valid_attributes
      attributes_for(:segmentation_variable).tap do |attrs|
        attrs.delete :slug
        attrs["segmentation_variable_values_attributes"] = {
          '1' => attributes_for(:segmentation_variable_value),
          '2' => attributes_for(:segmentation_variable_value)
        }
      end
    end

    def put_update attrs=nil
      attrs ||= valid_attributes
      put :update,
          { id: variable.to_param,
            segmentation_variable: attrs},
          valid_session
    end

    context "when there is no user logged in" do
      let(:user) { nil }

      before :each do
        put_update
      end

      it_behaves_like "user is not authenticated"
    end

    context "when there is a user logged in" do
      let(:user) { create :user }

      context "and can 'update' the variable" do

        before :each do
          controller.should_receive(:authorize!).and_return true
        end

        context "with valid params" do
          it "updates the requested resource" do
            SegmentationVariable.any_instance.should_receive(:clean_update_attributes).with({'name' => 'params'}).and_return true
            put_update 'name' => 'params'
          end

          it "assigns the requested resource as an instance variable" do
            put_update
            expect(assigns(:segmentation_variable)).to eq(variable)
          end

          it "redirects to the created resource" do
            put_update
            expect(response).to redirect_to(root_path)
          end

          it "sets the flash" do
            put_update
            should set_the_flash
          end
        end

        describe "with invalid params" do
          before :each do
            variable
            SegmentationVariable.any_instance.stub(:save).and_return(false)
            put_update({})
          end

          it "assigns the variable as an instance variable" do
            expect(assigns(:segmentation_variable)).to eq(variable)
          end

          it "re-renders the 'edit' template" do
            expect(response).to render_template('edit')
          end
        end
      end

      context "and it cannot 'update' the variable" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          put_update
        end

        it_behaves_like "user is not authorized"
      end
    end
  end
end
