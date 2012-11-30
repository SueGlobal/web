# -*- encoding : utf-8 -*-
class StudiesController < ApplicationController
  before_filter :type_breadcrumb
  def show
    @type = params[:type].to_s
    @title = title_for_type @type
    @studies = select_by_type @type
    respond_to do |format|
      if @studies
        format.html # show.html.erb
        format.json { render json: @studies }
      else
        format.html { redirect_to root_path, alert: t2('show.alert')}
        format.json { head :no_content }
      end
    end
  end

  protected
  def type_breadcrumb
    add_breadcrumb title_for_type(params[:type]), studies_by_type_path(params[:type])
  end

  def select_by_type type
    type_to_study_map.select_by_type type
  end

  def title_for_type type
    type_to_study_map.title_for_type type
  end

  def type_to_study_map opts={}
    @type_to_study_map ||= TypeToStudyMap.new opts
  end

  def t2 path
    I18n.t path, scope: 'controllers.studies'
  end
end
