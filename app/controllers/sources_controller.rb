class SourcesController < IndexRelatedModelController
  related_model :source
  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sources }
    end
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
    respond_to do |format|
     format.html # show.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/new
  # GET /sources/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/1/edit
  def edit
  end

  # POST /sources
  # POST /sources.json
  def create
    respond_to do |format|
      if @source.save
        format.html { redirect_to @source, notice: t2('create.notice') }
        format.json { render json: @source, status: :created, location: @source }
      else
        format.html { render action: "new" }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sources/1
  # PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update_attributes(params[:source])
        format.html { redirect_to @source, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source.destroy

    respond_to do |format|
      format.html { redirect_to sources_url, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.sources'
  end
end
