# -*- encoding : utf-8 -*-
class ActivitiesController < ApplicationController
  before_filter :activities_breadcrumb_filter

  def search
    @query = query_by
  end

  def retrieve
    @query = query_by(params[:activity_query])
    @universities = @query.universities
    respond_to do |format|
      if @universities.any?
        format.html { render 'universities/index' }
        format.json { render json: @universities }
      else
        flash.now.alert = t2('retrieve.alert')
        format.html { render 'search' }
        format.json { render json: @query }
      end
    end
  end

  protected

  def activities_breadcrumb_filter
    add_breadcrumb t2('breadcrumb'), activities_search_path
  end

  def t2 path
    I18n.t path, scope: 'controllers.activities'
  end

  def query_by parameters={}
    ActivityQuery.new(parameters)
  end
end
