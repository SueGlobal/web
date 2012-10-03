class UniversitiesController < ApplicationController
  load_and_authorize_resource except: [:index, :show]
  before_filter :require_login, except: [:index, :show]

  # GET /universities
  # GET /universities.json
  def index
    @universities = University.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @universities }
    end
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    @university = University.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @university }
    end
  end

  # GET /universities/new
  # GET /universities/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @university }
    end
  end

  # GET /universities/1/edit
  def edit
    @university = University.find(params[:id])
  end

  # POST /universities
  # POST /universities.json
  def create
    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: t2('create.notice') }
        format.json { render json: @university, status: :created, location: @university }
      else
        format.html { render action: "new" }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /universities/1
  # PUT /universities/1.json
  def update
    respond_to do |format|
      if @university.update_attributes(params[:university])
        format.html { redirect_to @university, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university.destroy

    respond_to do |format|
      format.html { redirect_to universities_url }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.universities'
  end
end
