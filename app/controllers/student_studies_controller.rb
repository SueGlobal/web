# -*- encoding : utf-8 -*-
class StudentStudiesController < StudyController
  dependent_model :student_study

  # GET /student_studies
  # GET /student_studies.json
  def index
    @student_studies = @university.student_studies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_studies }
    end
  end

  # GET /student_studies/1
  # GET /student_studies/1.json
  def show
    @university = UniversityDecorator.decorate @student_study.university
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_study }
    end
  end

  # GET /student_studies/new
  # GET /student_studies/new.json
  def new
    @student_study.build_questions
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_study }
    end
  end

  # GET /student_studies/1/edit
  def edit
    @university = UniversityDecorator.decorate @student_study.university
  end

  # POST /student_studies
  # POST /student_studies.json
  def create
    respond_to do |format|
      if @student_study.save
        format.html { redirect_to @student_study, notice: t2('create.notice') }
        format.json { render json: @student_study, status: :created, location: @student_study }
      else
        format.html { render action: "new" }
        format.json { render json: @student_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_studies/1
  # PUT /student_studies/1.json
  def update
    @university = UniversityDecorator.decorate @student_study.university

    respond_to do |format|
      if @student_study.update_attributes(params[:student_study])
        format.html { redirect_to @student_study, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_studies/1
  # DELETE /student_studies/1.json
  def destroy
    @university = UniversityDecorator.decorate @student_study.university
    @student_study.destroy

    respond_to do |format|
      format.html { redirect_to @university, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.student_studies'
  end
end
