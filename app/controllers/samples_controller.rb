# -*- encoding : utf-8 -*-
class SamplesController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  load_and_authorize_resource :index, except: [:index, :show], find_by: :slug
  load_and_authorize_resource :sample, except: [:index, :show, :create], through: :index,
    shallow: true, singleton: true, find_by: :slug

  before_filter :add_index_breadcrumb, except: [:index, :show, :edit, :update, :create]
  before_filter :add_ordered_variables, only: [:new, :create, :edit, :update]
  # GET /samples
  # GET /samples.json
  def index
    @index = Index.find_by_slug(params[:index_id])
    @samples = @index.samples
    add_index_breadcrumb

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @samples }
    end
  end

  # GET /samples/1
  # GET /samples/1.json
  def show
    @sample = Sample.find_by_slug params[:id]
    @index = @sample.index
    add_index_breadcrumb
    add_sample_breadcrumb
    add_ordered_variables
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/new
  # GET /samples/new.json
  def new
    @sample = Sample.from_index @index
    add_ordered_variables
    @path = [@index, @sample]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/1/edit
  def edit
    @index = @sample.index
    add_index_breadcrumb
    add_sample_breadcrumb
    add_ordered_variables
    @path = @sample
  end

  # POST /samples
  # POST /samples.json
  def create
    set_time
    set_periodicity
    create_values_for(@sample, params[:sample][:sample_values_attributes])
    respond_to do |format|
      if @sample.save
        format.html { redirect_to @sample, notice: t2('create.notice')}
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
    set_time
    set_periodicity
    update_values_for(params[:sample][:sample_values_attributes])
    respond_to do |format|
      if @sample.save
        format.html { redirect_to @sample, notice: t2('update.notice')}
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
      format.html { redirect_to index_samples_url(@index), notice: t2('destroy.notice') }
      format.json { head :no_content }
    end
  end

  protected

  def create_values_for sample, values
    values.each_pair do |_, value|
      SampleValue.new do |v|
        v.segmentation_variable_value_ids = value[:segmentation_variable_value_ids]
        v.value = if value[:value].blank?
                    nil
                  else
                    value[:value].to_f
                  end
        sample.sample_values << v
      end
    end
  end

  def update_values_for values
    values.each_pair do |key,value|
      SampleValue.find_by_id(key).tap do |v|
        v.value = if value[:value].blank?
                    nil
                  else
                    value[:value].to_f
                  end
        v.save
      end
    end
  end

  def set_time
    if sample.can_edit_header? &&
      params[:sample][:"taken_at(1i)"].present? &&
      params[:sample][:"taken_at(2i)"].present? &&
      params[:sample][:"taken_at(3i)"].present?

      @sample.taken_at = Time.utc params[:sample][:"taken_at(1i)"],params[:sample][:"taken_at(2i)"],params[:sample][:"taken_at(3i)"]
    end
  end

  def set_periodicity
    if sample.can_edit_header? &&
      params[:sample][:periodicity_attributes][:periodicity_type].present?

      @sample.periodicity.periodicity_type = params[:sample][:periodicity_attributes][:periodicity_type]
    end
  end


  def add_index_breadcrumb
    add_breadcrumb @index.name, index_path(@index)
  end

  def add_sample_breadcrumb
    add_breadcrumb @sample.taken_at.strftime('%m-%Y'), sample_path(@sample)
  end

  def add_ordered_variables
    @ordered_variables = OrderedVariables.new @sample
  end

  def t2 path
    I18n.t path, scope: 'controllers.samples'
  end
end
