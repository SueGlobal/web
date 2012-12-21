require 'spec_helper'

describe JournalsController do

  def valid_attributes
    attributes_for(:journal).except(:slug)
  end

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:journal) { create :journal }

  describe "GET index" do
    context "when no user is signed in" do
      let(:user) { nil }

      before :each do
        get :index, {}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user can see index" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
        journal
        get :index, {}, valid_session
      end

      it "assigns all journals as @journals" do
        assigns(:journals).should eq([journal])
      end

      it "renders index" do
        expect(response).to render_template('index')
      end
    end
  end

  describe "GET show" do
    context "when no user is signed in" do
      let(:user) { nil }

      before :each do
        get :show, {id: journal.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user can see index" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
        journal
        get :show, {id: journal.to_param}, valid_session
      end

      it "assigns the requested journal as @journal" do
        expect(assigns(:journal)).to eq(journal)
      end

      it "renders show template" do
        expect(response).to render_template('show')
      end
    end
  end

  describe "GET new" do

    context "when no user is signed in" do
      let(:user) { nil }

      before :each do
        get :new, {}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user can see index" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
        get :new, {}, valid_session
      end

      it "assigns a new journal as @journal" do
        assigns(:journal).should be_a_new(Journal)
      end

      it "renders new" do
        expect(response).to render_template('new')
      end
    end
  end

  describe "GET edit" do
    before :each do
      journal
    end

    context "when no user is signed in" do
      let(:user) { nil }

      before :each do
        get :edit, {id: journal.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user can see index" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
        get :edit, {id: journal.to_param}, valid_session
      end

      it "assigns a new journal as @journal" do
        assigns(:journal).should eq(journal)
      end

      it "renders new" do
        expect(response).to render_template('edit')
      end
    end
  end

  describe "POST create" do
    context "when no user is signed in" do
      let(:user) { nil }

      before :each do
         post :create, {journal: valid_attributes}, valid_session
      end

      it_behaves_like 'user is not authenticated'
    end

    context "when user is signed in" do
      let(:user) { create :user }

      context "when user can 'create' journal" do

        before :each do
          controller.should_receive(:authorize!).and_return true
        end

        describe "with valid params" do
          it "creates a new Journal" do
            expect {
              post :create, {:journal => valid_attributes}, valid_session
            }.to change(Journal, :count).by(1)
          end

          it "assigns a newly created journal as @journal" do
            post :create, {:journal => valid_attributes}, valid_session
            assigns(:journal).should be_a(Journal)
            assigns(:journal).should be_persisted
          end

          it "redirects to the created journal" do
            post :create, {:journal => valid_attributes}, valid_session
            response.should redirect_to(journals_path)
          end
        end

        describe "with invalid params" do
          before :each do
            Journal.any_instance.stub(:save).and_return(false)
            post :create, {:journal => {}}, valid_session
          end

          it "assigns a newly created but unsaved journal as @journal" do
            assigns(:journal).should be_a_new(Journal)
          end

          it "re-renders the 'new' template" do
            response.should render_template("new")
          end
        end
      end
    end
  end

  describe "PUT update" do
    describe "when user is not loggged in" do
      let(:user) { nil }

      before :each do
        put :update, {id: journal.to_param, journal: valid_attributes}, valid_session
      end

      it_behaves_like 'user is not authenticated'
    end

    context "when user is logged in" do
      let(:user) { create :user }

      context "when user is can 'update' journal" do
        before :each do
          controller.should_receive(:authorize!).and_return true
        end

        describe "with valid params" do
          it "updates the requested journal" do
            journal
            Journal.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
            put :update, {:id => journal.to_param, :journal => {'these' => 'params'}}, valid_session
          end

          it "assigns the requested journal as @journal" do
            journal
            put :update, {:id => journal.to_param, :journal => valid_attributes}, valid_session
            assigns(:journal).should eq(journal)
          end

          it "redirects to the journal" do
            journal
            put :update, {:id => journal.to_param, :journal => valid_attributes}, valid_session
            response.should redirect_to(journals_path)
          end
        end

        describe "with invalid params" do
          before :each do
            journal
            # Trigger the behavior that occurs when invalid params are submitted
            Journal.any_instance.stub(:save).and_return(false)
            put :update, {:id => journal.to_param, :journal => {}}, valid_session
          end

          it "assigns the journal as @journal" do
            assigns(:journal).should eq(journal)
          end

          it "re-renders the 'edit' template" do
            response.should render_template("edit")
          end
        end
      end
    end
  end

  describe "DELETE destroy" do

    describe "when user is not logged in" do
      let(:user) { nil }

      before :each do
        delete :destroy, {id: journal.to_param}, valid_session
      end

      it_behaves_like "user is not authorized"
    end


    context "when user is logged in" do
      let(:user) { create :user }

      context "when user can 'destroy' journal" do
        before :each do
          controller.should_receive(:authorize!).and_return true
          journal
        end

        it "destroys the requested journal" do
          expect {
            delete :destroy, {:id => journal.to_param}, valid_session
          }.to change(Journal, :count).by(-1)
        end

        it "redirects to the journals list" do
          delete :destroy, {:id => journal.to_param}, valid_session
          response.should redirect_to(journals_url)
        end
      end
    end
  end
end
