# -*- encoding : utf-8 -*-
class IndicesController < IndexRelatedModelController

  related_model :index
  # GET /indices
  # GET /indices.json
  def index
    @indices = IndexDecorator.decorate Index.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @indices }
    end
  end

  # GET /indices/1
  # GET /indices/1.json
  def show
    @index = IndexDecorator.decorate @index
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @index }
    end
  end

  # GET /indices/new
  # GET /indices/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @index }
    end
  end

  # GET /indices/1/edit
  def edit
  end

  # POST /indices
  # POST /indices.json
  def create
    respond_to do |format|
      if @index.save
        format.html { redirect_to @index, notice: t2('create.notice') }
        format.json { render json: @index, status: :created, location: @index }
      else
        format.html { render action: "new" }
        format.json { render json: @index.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indices/1
  # PUT /indices/1.json
  def update
    respond_to do |format|
      if @index.update_attributes(params[:index])
        format.html { redirect_to @index, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @index.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indices/1
  # DELETE /indices/1.json
  def destroy
    @index.destroy

    respond_to do |format|
      format.html { redirect_to indices_url, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.indices'
  end
end
