require 'spec_helper'

describe AnnualReportsController do

  def valid_attributes
    attributes_for(:annual_report).except(:slug)
  end

  def valid_session
    {}
  end

  before :each do
    login_user user if user
  end

  let(:annual_report) { create :annual_report, :published }

  describe "GET index" do
    context "when user can see index" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
        annual_report
        get :index, {}, valid_session
      end

      it "assigns all annual reports as @annual_reports" do
        assigns(:annual_reports).should eq([annual_report])
      end

      it "renders index" do
        expect(response).to render_template('index')
      end
    end
  end

  describe "GET show" do

    context "when user can see show" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
        annual_report
        get :show, {id: annual_report.to_param}, valid_session
      end

      it "assigns the requested annual report as @annual_report" do
        expect(assigns(:annual_report)).to eq(annual_report)
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

      it "assigns a new annual report as @annual_report" do
        assigns(:annual_report).should be_a_new(AnnualReport)
      end

      it "renders new" do
        expect(response).to render_template('new')
      end
    end
  end

  describe "GET edit" do

    before :each do
      annual_report
    end

    context "when no user is signed in" do
      let(:user) { nil }

      before :each do
        get :edit, {id: annual_report.to_param}, valid_session
      end

      it_behaves_like "user is not authenticated"
    end

    context "when user can see index" do
      let(:user) { create :user }

      before :each do
        controller.should_receive(:authorize!).and_return true
        get :edit, {id: annual_report.to_param}, valid_session
      end

      it "assigns a new journal as @journal" do
        assigns(:annual_report).should eq(annual_report)
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
        post :create, {annual_report: valid_attributes}, valid_session
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
              post :create, {:annual_report => valid_attributes}, valid_session
            }.to change(AnnualReport, :count).by(1)
          end

          it "assigns a newly created journal as @journal" do
            post :create, {:annual_report => valid_attributes}, valid_session
            assigns(:annual_report).should be_a(AnnualReport)
            assigns(:annual_report).should be_persisted
          end

          it "redirects to the created annual report" do
            post :create, {:annual_report => valid_attributes}, valid_session
            response.should redirect_to(AnnualReport.last)
          end
        end

        describe "with invalid params" do
          before :each do
            AnnualReport.any_instance.stub(:save).and_return(false)
            post :create, {:annual_report => {}}, valid_session
          end

          it "assigns a newly created but unsaved journal as @journal" do
            assigns(:annual_report).should be_a_new(AnnualReport)
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
        put :update, {id: annual_report.to_param, annual_report: valid_attributes}, valid_session
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
          it "updates the requested annual journal" do
            annual_report
            AnnualReport.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
            put :update, {:id => annual_report.to_param, :annual_report => {'these' => 'params'}}, valid_session
          end

          it "assigns the requested annual report as @annual_report" do
            annual_report
            put :update, {:id => annual_report.to_param, :annual_report => valid_attributes}, valid_session
            assigns(:annual_report).should eq(annual_report)
          end

          it "redirects to the annual_report" do
            annual_report
            put :update, {:id => annual_report.to_param, :annual_report => valid_attributes}, valid_session
            response.should redirect_to(annual_report)
          end
        end

        describe "with invalid params" do
          before :each do
            annual_report
            # Trigger the behavior that occurs when invalid params are submitted
            AnnualReport.any_instance.stub(:save).and_return(false)
            put :update, {:id => annual_report.to_param, :annual_report => {}}, valid_session
          end

          it "assigns the journal as @journal" do
            assigns(:annual_report).should eq(annual_report)
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
        delete :destroy, {id: annual_report.to_param}, valid_session
      end

      it_behaves_like "user is not authorized"
    end


    context "when user is logged in" do
      let(:user) { create :user }

      context "when user can 'destroy' journal" do
        before :each do
          controller.should_receive(:authorize!).and_return true
          annual_report
        end

        it "destroys the requested journal" do
          expect {
            delete :destroy, {:id => annual_report.to_param}, valid_session
          }.to change(AnnualReport, :count).by(-1)
        end

        it "redirects to the journals list" do
          delete :destroy, {:id => annual_report.to_param}, valid_session
          response.should redirect_to(annual_reports_url)
        end
      end
    end
  end

end
