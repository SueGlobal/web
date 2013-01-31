module Report
  class SampleQuestionsReport < QuestionsReport

    def initialize study_report
      super "sample_question"
    end

    def count_by_sampling
      @count_by_sampling ||= create_counter.merge counter_for_field "sampling_option"
    end

    def relative_by_sampling total
      calculate_relative count_by_sampling, total
    end
  end
end