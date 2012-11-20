# -*- encoding : utf-8 -*-
class SegmentationVariablesController < IndexRelatedModelController
  load_and_authorize_resource :segmentation_variable, only: [:index]
  related_model :segmentation_variable
  # GET /segmentation_variables
  # GET /segmentation_variables.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @segmentation_variables }
    end
  end

  # GET /segmentation_variables/1
  # GET /segmentation_variables/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @segmentation_variable }
    end
  end

  # GET /segmentation_variables/new
  # GET /segmentation_variables/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @segmentation_variable }
    end
  end

  # GET /segmentation_variables/1/edit
  def edit
  end

  # POST /segmentation_variables
  # POST /segmentation_variables.json
  def create
    respond_to do |format|
      if @segmentation_variable.save
        format.html { redirect_to root_path, notice: t2('create.notice') }
        format.json { render json: @segmentation_variable, status: :created, location: @segmentation_variable }
      else
        format.html { render action: "new" }
        format.json { render json: @segmentation_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /segmentation_variables/1
  # PUT /segmentation_variables/1.json
  def update
    respond_to do |format|
      if @segmentation_variable.update_attributes(params[:segmentation_variable])
        format.html { redirect_to root_path, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @segmentation_variable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /segmentation_variables/1
  # DELETE /segmentation_variables/1.json
  def destroy
    @segmentation_variable.destroy

    respond_to do |format|
      format.html { redirect_to segmentation_variables_url, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.segmentation_variables'
  end
end
