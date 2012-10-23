# -*- encoding : utf-8 -*-
class ServicesController < UniversityDependentModelController
  dependent_model :service

  # GET /services
  # GET /services.json
  def index
    @services = @university.services

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @university = UniversityDecorator.decorate @service.university
  end

  # POST /services
  # POST /services.json
  def create
    respond_to do |format|
      if @service.save
        format.html { redirect_to @university, notice: t2('create.notice') }
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
    @university = UniversityDecorator.decorate @service.university

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @university, notice: t2('update.notice') }
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
    @university = UniversityDecorator.decorate @service.university
    @service.destroy

    respond_to do |format|
      format.html { redirect_to @service.university, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.services'
  end
end
