require 'spec_helper'

describe ServicesController do

  # This should return the minimal set of attributes required to create a valid
  # Service. As you add validations to Service, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for :service
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ServicesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    login_user user if user
  end

  let(:service) { create :service }
  let(:university) { service.university }

  let(:other_service) { create :service }
  let(:other_service) { other_service.university }

  describe "GET index" do
    let(:user) { nil }
    it "assigns all university services as @services" do
      other_service = create :service
      get :index, {university_id: university.to_param}, valid_session
      assigns(:services).should eq([service])
      assigns(:services).should_not include(other_service)
    end
  end

  describe "GET new" do

    context "when there is no user" do
      let(:user) { nil }

      it "behaves as not authenticated" do
        get :new, {university_id: university.to_param}, valid_session
        behave_as_not_authenticated
      end
    end

    context "when user is authenticated" do
      let(:user) { create :user }

      context "when user can 'new' a service" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
          get :new, {university_id: university.to_param}, valid_session
        end

        it "assigns a new service as @service" do
          assigns(:service).should be_a_new(Service)
        end

        it "assigns university_id to university.id in the new service" do
          assigns(:service).university_id.should eq(university.id)
        end
      end

      context "when user cannot 'new' a service" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          get :new, {university_id: university.to_param}, valid_session
        end

        it { behave_as_unauthorized }
      end
    end
  end

  describe "GET edit" do
    context "when there is no user" do
      let(:user) { nil }

      before :each do
        get :edit, {id: service.to_param}, valid_session
      end

      it { behave_as_not_authenticated }
    end

    context "when there is a user" do
      let(:user) { create :user }

      context "and it can 'edit' a service" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
          get :edit, {id: service.to_param}, valid_session
        end

        it "assigns the requested service as @service" do
          assigns(:service).should eq(service)
        end
      end

      context "and it cannot 'edit' a service" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_raise CanCan::AccessDenied
          get :edit, {id: service.to_param}, valid_session
        end

        it { behave_as_unauthorized }
      end
    end
  end

  describe "POST create" do

    def post_create
      post :create, {university_id: university.to_param,
        service: valid_attributes}, valid_session
    end

    context "when there is no user" do
      let(:user) { nil }

      before(:each) do
        post_create
      end

      it { behave_as_not_authenticated }

    end

    context "when there is a user" do
      let(:user) { create :user }

      context "and can 'create' services" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        describe "with valid params" do
          it "creates a new Service" do
            service # For the expectation to pass.
            expect {
              post_create
            }.to change(Service, :count).by(1)
          end

          it "assigns a newly created service as @service" do
            post_create
            assigns(:service).should be_a(Service)
            assigns(:service).should be_persisted
          end

          it "redirects to the created service" do
            post_create
            response.should redirect_to(Service.last)
          end

          it "sets the flash" do
            post_create
            should set_the_flash
          end
        end

        describe "with invalid params" do
          it "assigns a newly created but unsaved service as @service" do
            # Trigger the behavior that occurs when invalid params are submitted
            Service.any_instance.stub(:save).and_return(false)
            post_create
            assigns(:service).should be_a_new(Service)
          end

          it "re-renders the 'new' template" do
            # Trigger the behavior that occurs when invalid params are submitted
            Service.any_instance.stub(:save).and_return(false)
            post_create
            response.should render_template("new")
          end
        end
      end

      context "and cannot 'create' service" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          post_create
        end

        it { behave_as_unauthorized }
      end
    end
  end

  describe "PUT update" do
    context "when there is no user" do
      let(:user) { nil }

      before :each do
        put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
      end

      it { behave_as_not_authenticated }
    end

    context "when there is a user" do
      let(:user) { create :user }
      context "and it can 'update' service" do
        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return(true)
        end

        describe "with valid params" do
          it "updates the requested service" do
            service
            Service.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
            put :update, {:id => service.to_param, :service => {'these' => 'params'}}, valid_session
          end

          it "assigns the requested service as @service" do
            service
            put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
            assigns(:service).should eq(service)
          end

          it "redirects to the service" do
            service
            put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
            response.should redirect_to(service)
          end

          it "sets the flash" do
            put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
            should set_the_flash
          end
        end

        describe "with invalid params" do
          before :each do
            service
            # Trigger the behavior that occurs when invalid params are submitted
            Service.any_instance.stub(:save).and_return(false)
            put :update, {:id => service.to_param, :service => {}}, valid_session
          end

          it "assigns the service as @service" do
            assigns(:service).should eq(service)
          end

          it "re-renders the 'edit' template" do
            response.should render_template("edit")
          end
        end
      end

      context "and it cannot 'update' service" do
        before :each do
          controller.should_receive(:authorize!).and_raise CanCan::AccessDenied
          put :update, {:id => service.to_param, :service => valid_attributes}, valid_session
        end

        it { behave_as_unauthorized }
      end
    end
  end

  describe "DELETE destroy" do
    context "when there is no user" do

      let(:user) { nil }

      before :each do
        delete :destroy, {id: service.to_param}, valid_session
      end

      it { behave_as_not_authenticated }
    end

    context "when there is a user" do

      let(:user) { create :user }

      context "and it can 'destroy' service" do

        before :each do
          controller.should_receive(:authorize!).at_least(:once).and_return true
        end

        it "destroys the requested service" do
          service
          expect {
            delete :destroy, {:id => service.to_param}, valid_session
          }.to change(Service, :count).by(-1)
        end

        it "redirects to the services list" do
          service
          delete :destroy, {:id => service.to_param}, valid_session
          response.should redirect_to(service.university)
        end
      end
    end
  end
end
