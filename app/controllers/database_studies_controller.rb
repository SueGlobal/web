# -*- encoding : utf-8 -*-
class DatabaseStudiesController < StudyController
  dependent_model :database_study

  # GET /database_studies
  # GET /database_studies.json
  def index
    @database_studies = @university.database_studies

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @database_studies }
    end
  end

  # GET /database_studies/1
  # GET /database_studies/1.json
  def show
    @university = UniversityDecorator.decorate @database_study.university

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @database_study }
    end
  end

  # GET /database_studies/new
  # GET /database_studies/new.json
  def new
    @database_study.build_questions

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @database_study }
    end
  end

  # GET /database_studies/1/edit
  def edit
    @university = UniversityDecorator.decorate @database_study.university
  end

  # POST /database_studies
  # POST /database_studies.json
  def create
    respond_to do |format|
      if @database_study.save
        format.html { redirect_to @database_study, notice: t2('create.notice') }
        format.json { render json: @database_study, status: :created, location: @database_study }
      else
        format.html { render action: "new" }
        format.json { render json: @database_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /database_studies/1
  # PUT /database_studies/1.json
  def update
    @university = UniversityDecorator.decorate @database_study.university
    respond_to do |format|
      if @database_study.update_attributes(params[:database_study])
        format.html { redirect_to @database_study, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @database_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /database_studies/1
  # DELETE /database_studies/1.json
  def destroy
    @university = UniversityDecorator.decorate @database_study.university
    @database_study.destroy

    respond_to do |format|
      format.html { redirect_to database_studies_url, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.database_studies'
  end
end
