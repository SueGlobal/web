# -*- encoding : utf-8 -*-
class GeneralFramesController < UniversityDependentModelController
  dependent_model :general_frame

  # GET /general_frames
  # GET /general_frames.json
  def index
    @general_frames = @university.general_frames

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @general_frames }
    end
  end

  # GET /general_frames/1
  # GET /general_frames/1.json
  def show
    @university = UniversityDecorator.decorate @general_frame.university
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @general_frame }
    end
  end

  # GET /general_frames/new
  # GET /general_frames/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @general_frame }
    end
  end

  # GET /general_frames/1/edit
  def edit
    @university = UniversityDecorator.decorate @general_frame.university
  end

  # POST /general_frames
  # POST /general_frames.json
  def create
    respond_to do |format|
      if @general_frame.save
        format.html { redirect_to @general_frame, notice: t2('create.notice') }
        format.json { render json: @general_frame, status: :created, location: @general_frame }
      else
        format.html { render action: "new" }
        format.json { render json: @general_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /general_frames/1
  # PUT /general_frames/1.json
  def update
    @university = UniversityDecorator.decorate @general_frame.university
    respond_to do |format|
      if @general_frame.update_attributes(params[:general_frame])
        format.html { redirect_to @general_frame, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @general_frame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_frames/1
  # DELETE /general_frames/1.json
  def destroy
    @university = UniversityDecorator.decorate @general_frame.university
    @general_frame.destroy

    respond_to do |format|
      format.html { redirect_to @general_frame.university, notice: t2('destroy.notice') }
      format.json { head :no_content }
      format.js { render partial: 'destroy_animation', locals: { resource: @general_frame } }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.general_frames'
  end
end
