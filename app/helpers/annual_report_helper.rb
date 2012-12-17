module AnnualReportHelper
  def with_report(report_klazz, study)
    report = report_klazz.new(study)
    if report.exists_for_study? && block_given?
      yield report
    else
      ""
    end
  end
end
