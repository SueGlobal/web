# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SamplesController do

  def valid_attributes
    attributes_for :sample
  end

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:index) { create :index }
  let(:sample) { create :sample, index: index }
  let(:other_index) { create :index }
  let(:other_sample) { create :sample, index: other_index }
  describe "GET index" do
    let(:user) { nil }
    it "assigns all samples as @samples" do
      sample
      get :index, {index_id: index.to_param}, valid_session
      assigns(:samples).should eq([sample])
    end
  end

  describe "GET show" do
    let(:user) { nil }
    it "assigns the requested sample as @sample" do
      sample
      get :show, {:id => sample.to_param}, valid_session
      assigns(:sample).should eq(sample)
    end
  end

  describe "GET new" do
    context "when user is not logged in" do
      let(:user) { nil }

      before :each do
        get :new, {index_id: index.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user }
      context "and user can 'new' a sample" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
          get :new, {index_id: index.to_param}, valid_session
        end

        it "assigns a new sample as @sample" do
          expect(assigns(:sample)).to be_a_new(Sample)
        end

        it "renders 'new'" do
          expect(response).to render_template('new')
        end
      end

      context "and user cannot 'new' a sample" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          get :new, {index_id: index.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "GET edit" do
    context "when user is not logged in" do
      let(:user) { nil }

      before :each do
        get :edit, {id: sample.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "and user can 'edit' the sample" do
        before :each do
          sample
          controller.should_receive(:authorize!).at_least(:once).and_return true
          get :edit, {id: sample.to_param}, valid_session
        end

        it "assigns the requested sample as @sample" do
          expect(assigns(:sample)).to eq(sample)
        end

        it "renders 'edit'" do
          expect(response).to render_template('edit')
        end
      end
      context "and user cannot 'edit' the sample" do
        before :each do
           controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
           get :edit, {id: sample.to_param}, valid_session
        end

        it_behaves_like "user is not authorized"
      end
    end
  end

  describe "POST create" do
    def post_create attrs=nil
      post :create,
        { index_id: index.to_param,
          sample: (attrs || valid_attributes) },
        valid_session
    end

    context "when user is not logged in" do
      let(:user) { nil }

      before :each do
        post_create
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "when user can 'create' samples" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        describe "with valid params" do
          it "creates a new Sample" do
            expect {
              post_create
            }.to change(Sample, :count).by(1)
          end

          it "assigns a newly created sample as @sample" do
            post_create
            expect(assigns(:sample)).to be_a(Sample)
            expect(assigns(:sample)).to be_persisted
          end

          it "redirects to the created sample" do
            post_create
            expect(response).to redirect_to(Sample.last)
          end
        end

        describe "with invalid params" do
          it "assigns a newly created but unsaved sample as @sample" do
            # Trigger the behavior that occurs when invalid params are submitted
            Sample.any_instance.stub(:save).and_return(false)
            post_create {}
            expect(assigns(:sample)).to be_a_new(Sample)
          end

          it "re-renders the 'new' template" do
            # Trigger the behavior that occurs when invalid params are submitted
            Sample.any_instance.stub(:save).and_return(false)
            post_create {}
            expect(response).to render_template("new")
          end
        end

      end # END user can 'create' samples

      context "when user cannot 'create' samples" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          post_create
        end

        it_behaves_like "user is not authorized"
      end
    end
  end # END POST create

  describe "PUT update" do
    def put_update attrs=nil
      put :update,
        { id: sample.to_param,
          sample: (attrs || valid_attributes) },
        valid_session
    end

    context "when user is not logged in" do
      let(:user) { nil }

      before :each do
        put_update
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "when user can 'update' sample" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        describe "with valid params" do
          it "updates the requested sample" do
            sample
            Sample.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
            put_update({'these' => 'params'})
          end

          it "assigns the requested sample as @sample" do
            sample
            put_update
            expect(assigns(:sample)).to eq(sample)
          end

          it "redirects to the sample" do
            sample
            put_update
            expect(response).to redirect_to(sample)
          end
        end

        describe "with invalid params" do
          it "assigns the sample as @sample" do
            sample
            Sample.any_instance.stub(:save).and_return(false)
            put_update({})
            expect(assigns(:sample)).to eq(sample)
          end

          it "re-renders the 'edit' template" do
            sample
            Sample.any_instance.stub(:save).and_return(false)
            put_update({})
            expect(response).to render_template("edit")
          end
        end
      end # END when user can 'update' sample
    end # END when user is logged in
  end # END PUT update

  describe "DELETE destroy", :focus do
    def delete_destroy id=nil
      delete :destroy, {id: (id || sample.to_param)}, valid_session
    end

    context "when user is not logged in" do
      let(:user) { nil }

      it "does not destroy the sample" do
        sample
        expect {
          delete_destroy
        }.not_to change(Sample, :count)
      end

      it_behaves_like "user is not authenticated" do
        before :each do
          delete_destroy
        end
      end
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "and can 'destroy' samples" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        it "destroys the requested sample" do
          sample
          expect {
            delete_destroy
          }.to change(Sample, :count).by(-1)
        end

        it "redirects to the samples list" do
          sample
          delete_destroy
          expect(response).to redirect_to(index_samples_url(index))
        end
      end # END can 'destroy' samples

      context "and cannot 'destroy' samples" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          delete_destroy
        end

        it_behaves_like "user is not authorized"
      end
    end # END user is logged in
  end # END DELETE destroy

end
