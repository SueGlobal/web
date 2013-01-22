class AnnualReportController < ApplicationController

  before_filter :set_year
  before_filter :set_study_type, only: [:show]
  def index
  end

  def show
    @total = @study.year(@year).count
    @report = @study.report_for(@year)
  end

  private
  def set_year
    @year = if params[:year].present?
              params[:year].to_i
            else
              Date.today.year
            end
  end

  def set_study_type
    @study = type_to_study_map.model_for_type params[:type]
  end

  def type_to_study_map opts={}
    @type_to_study_map ||= TypeToStudyMap.new opts
  end
end
