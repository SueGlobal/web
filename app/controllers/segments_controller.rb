# -*- encoding : utf-8 -*-
class SegmentsController < ApplicationController

  before_filter :require_login

  load_and_authorize_resource :segmentation_variable, find_by: :slug
  load_and_authorize_resource :segment, throug: :segmentation_variable,
    find_by: :slug
  # GET /segments/new
  # GET /segments/new.json
  def new
    @segment = @segmentation_variable.segments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @segment }
    end
  end

  # POST /segments
  # POST /segments.json
  def create
    @segment = @segmentation_variable.segments.create(params[:segment])

    respond_to do |format|
      if @segment.save
        format.html { redirect_to @segmentation_variable, notice: t2('create.notice')}
        format.json { render json: @segment, status: :created, location: @segment }
      else
        format.html { render action: "new" }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.segments'
  end
end
