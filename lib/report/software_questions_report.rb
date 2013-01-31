module Report
  class SoftwareQuestionsReport < QuestionsReport

    def initialize study_report
      super "software_question"
    end

    def uses_some_count
      @uses_some_count ||= count_boolean_type "uses_some"
    end

    def uses_some_relative total
      calculate_relative uses_some_count, total
    end
  end
end