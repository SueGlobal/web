# -*- encoding : utf-8 -*-
class UniversitiesController < ApplicationController
  load_and_authorize_resource except: [:index, :show]
  before_filter :require_login, except: [:index, :show]
  before_filter :add_breadcrumb_for_university, only: [:add_user, :edit, :update]

  # GET /universities
  # GET /universities.json
  def index
    @universities = UniversityDecorator.decorate(University.all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @universities }
    end
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    @university = UniversityDecorator.find(params[:id])

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
  end

  # POST /universities
  # POST /universities.json
  def create
    emails = get_emails_from(params[:university][:admin_emails])
    register = UniversityRegister.new(@university, emails)
    respond_to do |format|
      if register.save
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
      format.js { render partial: 'destroy_animation', locals: { resource: @university } }
    end
  end

  # GET /universities/1/add_user
  # GET /universities/1/add_user.json
  def add_user
    respond_to do |format|
      format.html
    end
  end

  def do_add_user
    @register = UniversityRegister.new @university, get_emails_from(params[:add_user][:email])
    @register.save
  end

  protected

  def add_breadcrumb_for_university
    add_breadcrumb @university.abbreviation, university_path(@university)
  end

  def get_emails_from attr
    (attr || "").split(',').map(&:strip)
  end

  def t2 path
    I18n.t path, scope: 'controllers.universities'
  end
end
