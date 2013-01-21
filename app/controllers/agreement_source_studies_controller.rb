# -*- encoding : utf-8 -*-
class AgreementSourceStudiesController < StudyController
  dependent_model :agreement_source_study

  # GET /agreement_source_studies
  # GET /agreement_source_studies.json
  def index
    @agreement_source_studies = @university.agreement_source_studies.page(params[:page])
    @studies = @agreement_source_studies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agreement_source_studies }
    end
  end

  # GET /agreement_source_studies/1
  # GET /agreement_source_studies/1.json
  def show
    @university = UniversityDecorator.decorate @agreement_source_study.university
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agreement_source_study }
    end
  end

  # GET /agreement_source_studies/new
  # GET /agreement_source_studies/new.json
  def new
    @agreement_source_study.build_questions
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agreement_source_study }
    end
  end

  # GET /agreement_source_studies/1/edit
  def edit
    @university = UniversityDecorator.decorate @agreement_source_study.university
  end

  # POST /agreement_source_studies
  # POST /agreement_source_studies.json
  def create
    respond_to do |format|
      if @agreement_source_study.save
        format.html { redirect_to @agreement_source_study, notice: t2('create.notice') }
        format.json { render json: @agreement_source_study, status: :created, location: @agreement_source_study }
      else
        format.html { render action: "new" }
        format.json { render json: @agreement_source_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agreement_source_studies/1
  # PUT /agreement_source_studies/1.json
  def update
    @university = UniversityDecorator.decorate @agreement_source_study.university
    respond_to do |format|
      if @agreement_source_study.update_attributes(params[:agreement_source_study])
        format.html { redirect_to @agreement_source_study, notice: t2('update.notice')}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agreement_source_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agreement_source_studies/1
  # DELETE /agreement_source_studies/1.json
  def destroy
    @university = UniversityDecorator.decorate @agreement_source_study.university
    @agreement_source_study.destroy

    respond_to do |format|
      format.html { redirect_to @university, notice: t2('destroy.notice') }
      format.json { head :no_content }
      format.js { render partial: 'destroy_animation', locals: { resource: @agreement_source_study } }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.agreement_source_studies'
  end
end
