class JournalsController < ApplicationController
  before_filter :require_login

  load_and_authorize_resource :journal

  before_filter :set_journals_breadcrumb
  before_filter :set_journal_breadcrumb, only: [:show, :edit, :update]
  # GET /journals
  # GET /journals.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @journals }
    end
  end

  # GET /journals/1
  # GET /journals/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @journal }
    end
  end

  # GET /journals/new
  # GET /journals/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @journal }
    end
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    respond_to do |format|
      if @journal.save
        format.html { redirect_to journals_path, notice: t2('create.notice')  }
        format.json { render json: @journal, status: :created, location: @journal }
        format.js { render 'create.success' }
      else
        format.html { render action: "new" }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
        format.js { render 'create.fail' }
      end
    end
  end

  # PUT /journals/1
  # PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update_attributes(params[:journal])
        format.html { redirect_to journals_path, notice: t2('update.notice')}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy

    respond_to do |format|
      format.html { redirect_to journals_url, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def set_journals_breadcrumb
    add_breadcrumb Journal.model_name.human(count: 2), journals_path
  end

  def set_journal_breadcrumb
    add_breadcrumb @journal.title, @journal
  end

  def t2 path
    I18n.t path, scope: 'controllers.journals'
  end
end
