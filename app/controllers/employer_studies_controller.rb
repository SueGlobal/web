# -*- encoding : utf-8 -*-
class EmployerStudiesController < StudyController
  dependent_model :employer_study

  # GET /employer_studies
  # GET /employer_studies.json
  def index
    @employer_studies = @university.employer_studies.page(params[:page])
    @studies = @employer_studies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employer_studies }
    end
  end

  # GET /employer_studies/1
  # GET /employer_studies/1.json
  def show
    @university = UniversityDecorator.decorate @employer_study.university
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employer_study }
    end
  end

  # GET /employer_studies/new
  # GET /employer_studies/new.json
  def new
    @employer_study.build_questions
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employer_study }
    end
  end

  # GET /employer_studies/1/edit
  def edit
    @university = UniversityDecorator.decorate @employer_study.university
  end

  # POST /employer_studies
  # POST /employer_studies.json
  def create
    respond_to do |format|
      if @employer_study.save
        format.html { redirect_to @employer_study, notice: t2('create.notice') }
        format.json { render json: @employer_study, status: :created, location: @employer_study }
      else
        format.html { render action: "new" }
        format.json { render json: @employer_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employer_studies/1
  # PUT /employer_studies/1.json
  def update
    @university = UniversityDecorator.decorate @employer_study.university
    respond_to do |format|
      if @employer_study.update_attributes(params[:employer_study])
        format.html { redirect_to @employer_study, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employer_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employer_studies/1
  # DELETE /employer_studies/1.json
  def destroy
    @university = UniversityDecorator.decorate @employer_study.university
    @employer_study.destroy

    respond_to do |format|
      format.html { redirect_to university_path(@university), notice: t2('destroy.notice') }
      format.json { head :no_content }
      format.js { render partial: 'destroy_animation', locals: { resource: @employer_study } }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.employer_studies'
  end
end
