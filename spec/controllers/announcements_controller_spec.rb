# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AnnouncementsController do

  # This should return the minimal set of attributes required to create a valid
  # Announcement. As you add validations to Announcement, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AnnouncementsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  context "when user is not logged in" do
    describe "GET index" do
      before :each do
        get :index, {}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    describe "GET show" do
      before :each do
        announcement = create :announcement
        get :show, {id: announcement.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    describe "GET new" do
      before :each do
        get :new, {}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    describe "GET edit" do
      before :each do
        announcement = create :announcement
        get :edit, {id: announcement.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    describe "POST create" do
      before :each do
        expect {
          post :create, {:announcement => valid_attributes}, valid_session
        }.not_to change(Announcement, :count)
      end

      it_behaves_like "user is not authenticated"
    end

    describe "PUT update" do
      before :each do
        announcement = create :announcement
        put :update, {id: announcement.to_param, announcement: valid_attributes},
          valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    describe "DELETE destroy" do
      before :each do
        announcement = create :announcement
        expect {
          delete :destroy, {id: announcement.to_param}, valid_session
        }.not_to change(Announcement, :count)
      end

      it_behaves_like "user is not authenticated"
    end
  end

  context "when user cannot announce" do
    before :each do
      login_user create(:user)
      controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
    end

    describe "GET index" do
      before :each do
        get :index, {}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "GET show" do
      before :each do
        announcement = create :announcement
        get :show, {id: announcement.to_param}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "GET new" do
      before :each do
        get :new, {}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "GET edit" do
      before :each do
        announcement = create :announcement
        get :edit, {id: announcement.to_param}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "POST create" do
      before :each do
        expect {
          post :create, {:announcement => valid_attributes}, valid_session
        }.not_to change(Announcement, :count)
      end

      it_behaves_like "user is not authorized"
    end

    describe "PUT update" do
      before :each do
        announcement = create :announcement
        put :update, {id: announcement.to_param, announcement: valid_attributes},
          valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "DELETE destroy" do
      before :each do
        announcement = create :announcement
        expect {
          delete :destroy, {id: announcement.to_param}, valid_session
        }.not_to change(Announcement, :count)
      end

      it_behaves_like "user is not authorized"
    end
  end

  context "when user cannot announce" do
    before :each do
      login_user create(:user)
      controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
    end

    describe "GET index" do
      before :each do
        get :index, {}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "GET show" do
      before :each do
        announcement = create :announcement
        get :show, {id: announcement.to_param}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "GET new" do
      before :each do
        get :new, {}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "GET edit" do
      before :each do
        announcement = create :announcement
        get :edit, {id: announcement.to_param}, valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "POST create" do
      before :each do
        expect {
          post :create, {:announcement => valid_attributes}, valid_session
        }.not_to change(Announcement, :count)
      end

      it_behaves_like "user is not authorized"
    end

    describe "PUT update" do
      before :each do
        announcement = create :announcement
        put :update, {id: announcement.to_param, announcement: valid_attributes},
          valid_session
      end

      it_behaves_like "user is not authorized"
    end

    describe "DELETE destroy" do
      before :each do
        announcement = create :announcement
        expect {
          delete :destroy, {id: announcement.to_param}, valid_session
        }.not_to change(Announcement, :count)
      end

      it_behaves_like "user is not authorized"
    end
  end

  context "when user can announce" do
    before :each do
      login_user create(:user)
      controller.should_receive(:authorize!).and_return(true)
    end

    describe "GET index" do
      it "assigns all announcements as @announcements" do
        announcement = Announcement.create! valid_attributes
        get :index, {}, valid_session
        assigns(:announcements).should eq([announcement])
      end
    end

    describe "GET show" do
      it "assigns the requested announcement as @announcement" do
        announcement = Announcement.create! valid_attributes
        get :show, {:id => announcement.to_param}, valid_session
        assigns(:announcement).should eq(announcement)
      end
    end

    describe "GET new" do
      it "assigns a new announcement as @announcement" do
        get :new, {}, valid_session
        assigns(:announcement).should be_a_new(Announcement)
      end
    end

    describe "GET edit" do
      it "assigns the requested announcement as @announcement" do
        announcement = Announcement.create! valid_attributes
        get :edit, {:id => announcement.to_param}, valid_session
        assigns(:announcement).should eq(announcement)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Announcement" do
          expect {
            post :create, {:announcement => valid_attributes}, valid_session
          }.to change(Announcement, :count).by(1)
        end

        it "assigns a newly created announcement as @announcement" do
          post :create, {:announcement => valid_attributes}, valid_session
          assigns(:announcement).should be_a(Announcement)
          assigns(:announcement).should be_persisted
        end

        it "redirects to the created announcement" do
          post :create, {:announcement => valid_attributes}, valid_session
          response.should redirect_to(Announcement.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved announcement as @announcement" do
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          post :create, {:announcement => {}}, valid_session
          assigns(:announcement).should be_a_new(Announcement)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          post :create, {:announcement => {}}, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested announcement" do
          announcement = Announcement.create! valid_attributes
          # Assuming there are no other announcements in the database, this
          # specifies that the Announcement created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Announcement.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
          put :update, {:id => announcement.to_param, :announcement => {'these' => 'params'}}, valid_session
        end

        it "assigns the requested announcement as @announcement" do
          announcement = Announcement.create! valid_attributes
          put :update, {:id => announcement.to_param, :announcement => valid_attributes}, valid_session
          assigns(:announcement).should eq(announcement)
        end

        it "redirects to the announcement" do
          announcement = Announcement.create! valid_attributes
          put :update, {:id => announcement.to_param, :announcement => valid_attributes}, valid_session
          response.should redirect_to(announcement)
        end
      end

      describe "with invalid params" do
        it "assigns the announcement as @announcement" do
          announcement = Announcement.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          put :update, {:id => announcement.to_param, :announcement => {}}, valid_session
          assigns(:announcement).should eq(announcement)
        end

        it "re-renders the 'edit' template" do
          announcement = Announcement.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Announcement.any_instance.stub(:save).and_return(false)
          put :update, {:id => announcement.to_param, :announcement => {}}, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested announcement" do
        announcement = Announcement.create! valid_attributes
        expect {
          delete :destroy, {:id => announcement.to_param}, valid_session
        }.to change(Announcement, :count).by(-1)
      end

      it "redirects to the announcements list" do
        announcement = Announcement.create! valid_attributes
        delete :destroy, {:id => announcement.to_param}, valid_session
        response.should redirect_to(announcements_url)
      end
    end
  end
end
