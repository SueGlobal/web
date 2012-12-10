# -*- encoding : utf-8 -*-
class SamplesController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  load_and_authorize_resource :index, except: [:index, :show], find_by: :slug
  load_and_authorize_resource :sample, except: [:index, :show], through: :index,
    shallow: true, singleton: true, find_by: :slug
  # GET /samples
  # GET /samples.json
  def index
    @index = Index.find_by_slug(params[:index_id])
    @samples = @index.samples

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @samples }
    end
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
    @sample = Sample.find_by_slug params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/new
  # GET /samples/new.json
  def new
    @sample = @index.samples.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples
  # POST /samples.json
  def create
    @sample = @index.samples.create params[:sample]

    respond_to do |format|
      if @sample.save
        format.html { redirect_to @sample, notice: 'Sample was successfully created.' }
        format.json { render json: @sample, status: :created, location: @sample }
      else
        format.html { render action: "new" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /samples/1
  # PUT /samples/1.json
  def update
    @sample = Sample.find(params[:id])

    respond_to do |format|
      if @sample.update_attributes(params[:sample])
        format.html { redirect_to @sample, notice: 'Sample was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample = Sample.find(params[:id])
    @index = @sample.index
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to index_samples_url(@index) }
      format.json { head :no_content }
    end
  end
end
