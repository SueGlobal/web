class SummaryController < ApplicationController

  before_filter :set_year
  def index
    @summary = summary_for_year(@year)
    @total = @summary.universities_with_info_count
    respond_to do |format|
      format.html
    end
  end

  protected
  def set_year
    @year = if params[:year].present?
              params[:year].to_i
            else
              Date.today.year
            end
  end

  def summary_for_year year
    UniversitiesSummary.new year,
      [Service, AchievedActivity, GeneralFrame,
        StudentStudy, EmployerStudy, PublicSourceStudy,
        AgreementSourceStudy, DatabaseStudy, OtherStudy]

  end
end
