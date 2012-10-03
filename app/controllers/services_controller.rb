class ServicesController < ApplicationController
  load_and_authorize_resource :university, except: [:index]
  load_and_authorize_resource :service, through: :university,
                              shallow: true, except: [:index]
  before_filter :require_login, except: [:index]

  # GET /services
  # GET /services.json
  def index
    @university = University.find(params[:university_id])
    @services = @university.services

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = @university.services.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: t2('create.notice') }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to @service.university }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.services'
  end
end
