class AnnualReportsController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  load_and_authorize_resource :annual_report

  before_filter :set_annual_reports_breadcrumb
  before_filter :set_annual_report_breadcrumb, only: [:show, :edit, :update]

  # GET /annual_reports
  # GET /annual_reports.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @annual_reports }
    end
  end

  # GET /annual_reports/1
  # GET /annual_reports/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @annual_report }
    end
  end

  # GET /annual_reports/new
  # GET /annual_reports/new.json
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @annual_report }
    end
  end

  # GET /annual_reports/1/edit
  def edit
  end

  # POST /annual_reports
  # POST /annual_reports.json
  def create
    respond_to do |format|
      if @annual_report.save
        format.html { redirect_to @annual_report, notice: t2('create.notice') }
        format.json { render json: @annual_report, status: :created, location: @annual_report }
        format.js { render 'create.success'}
      else
        format.html { render action: "new" }
        format.json { render json: @annual_report.errors, status: :unprocessable_entity }
        format.js { render 'create.fail'}
      end
    end
  end

  # PUT /annual_reports/1
  # PUT /annual_reports/1.json
  def update

    respond_to do |format|
      if @annual_report.update_attributes(params[:annual_report])
        format.html { redirect_to @annual_report, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @annual_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annual_reports/1
  # DELETE /annual_reports/1.json
  def destroy
    @annual_report.destroy

    respond_to do |format|
      format.html { redirect_to annual_reports_url, notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  private

  def set_annual_reports_breadcrumb
    add_breadcrumb AnnualReport.model_name.human(count: 2), annual_reports_path
  end

  def set_annual_report_breadcrumb
    add_breadcrumb @annual_report.title, @annual_report
  end

  def t2 path
    I18n.t path, scope: 'controllers.annual_reports'
  end
end
