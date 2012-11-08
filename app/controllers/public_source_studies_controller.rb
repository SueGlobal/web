# -*- encoding : utf-8 -*-
class PublicSourceStudiesController < StudyController
  dependent_model :public_source_study

  # GET /public_source_studies
  # GET /public_source_studies.json
  def index
    @public_source_studies = @university.public_source_studies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @public_source_studies }
    end
  end

  # GET /public_source_studies/1
  # GET /public_source_studies/1.json
  def show
    @university = UniversityDecorator.decorate @public_source_study.university
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @public_source_study }
    end
  end

  # GET /public_source_studies/new
  # GET /public_source_studies/new.json
  def new
    @public_source_study.build_questions
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @public_source_study }
    end
  end

  # GET /public_source_studies/1/edit
  def edit
    @university = UniversityDecorator.decorate @public_source_study.university
  end

  # POST /public_source_studies
  # POST /public_source_studies.json
  def create
    respond_to do |format|
      if @public_source_study.save
        format.html { redirect_to @public_source_study, notice: t2('create.notice') }
        format.json { render json: @public_source_study, status: :created, location: @public_source_study }
      else
        format.html { render action: "new" }
        format.json { render json: @public_source_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /public_source_studies/1
  # PUT /public_source_studies/1.json
  def update
    @university = UniversityDecorator.decorate @public_source_study.university
    respond_to do |format|
      if @public_source_study.update_attributes(params[:public_source_study])
        format.html { redirect_to @public_source_study, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @public_source_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_source_studies/1
  # DELETE /public_source_studies/1.json
  def destroy
    @university = UniversityDecorator.decorate @public_source_study.university
    @public_source_study.destroy

    respond_to do |format|
      format.html { redirect_to @university, notice: t2('destroy.notice') }
      format.json { head :no_content }
      format.js { render partial: 'destroy_animation', locals: { resource: @public_source_study } }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.public_source_studies'
  end
end
