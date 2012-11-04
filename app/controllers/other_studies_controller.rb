# -*- encoding : utf-8 -*-
class OtherStudiesController < StudyController
  dependent_model :other_study

  # GET /other_studies
  # GET /other_studies.json
  def index
    @other_studies = @university.other_studies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @other_studies }
    end
  end

  # GET /other_studies/1
  # GET /other_studies/1.json
  def show
    @university = UniversityDecorator.decorate @other_study.university
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @other_study }
    end
  end

  # GET /other_studies/new
  # GET /other_studies/new.json
  def new
    @other_study.build_questions
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @other_study }
    end
  end

  # GET /other_studies/1/edit
  def edit
    @university = UniversityDecorator.decorate @other_study.university
  end

  # POST /other_studies
  # POST /other_studies.json
  def create
    respond_to do |format|
      if @other_study.save
        format.html { redirect_to @other_study, notice: t2('create.notice') }
        format.json { render json: @other_study, status: :created, location: @other_study }
      else
        format.html { render action: "new" }
        format.json { render json: @other_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /other_studies/1
  # PUT /other_studies/1.json
  def update
    @university = UniversityDecorator.decorate @other_study.university
    respond_to do |format|
      if @other_study.update_attributes(params[:other_study])
        format.html { redirect_to @other_study, notice: t2('update.notice')}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @other_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_studies/1
  # DELETE /other_studies/1.json
  def destroy
    @university = UniversityDecorator.decorate @other_study.university
    @other_study.destroy

    respond_to do |format|
      format.html { redirect_to university_path(@university), notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.other_studies'
  end
end
