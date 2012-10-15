# -*- encoding : utf-8 -*-
class AchievedActivitiesController < UniversityDependentModelController
  dependent_model :achieved_activity

  # GET /achieved_activities
  # GET /achieved_activities.json
  def index
    @achieved_activities = @university.achieved_activities

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @achieved_activities }
    end
  end

  # GET /achieved_activities/1
  # GET /achieved_activities/1.json
  def show
    @university = UniversityDecorator.decorate @achieved_activity.university
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @achieved_activity }
    end
  end

  # GET /achieved_activities/new
  # GET /achieved_activities/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @achieved_activity }
    end
  end

  # GET /achieved_activities/1/edit
  def edit
    @university = UniversityDecorator.decorate @achieved_activity.university
  end

  # POST /achieved_activities
  # POST /achieved_activities.json
  def create
    respond_to do |format|
      if @achieved_activity.save
        format.html { redirect_to @achieved_activity, notice: t2('create.notice') }
        format.json { render json: @achieved_activity, status: :created, location: @achieved_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @achieved_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /achieved_activities/1
  # PUT /achieved_activities/1.json
  def update
    @university = UniversityDecorator.decorate @achieved_activity.university

    respond_to do |format|
      if @achieved_activity.update_attributes(params[:achieved_activity])
        format.html { redirect_to @achieved_activity, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @achieved_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achieved_activities/1
  # DELETE /achieved_activities/1.json
  def destroy
    @university = UniversityDecorator.decorate @achieved_activity.university
    @achieved_activity.destroy

    respond_to do |format|
      format.html { redirect_to @university, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.achieved_activities'
  end
end
