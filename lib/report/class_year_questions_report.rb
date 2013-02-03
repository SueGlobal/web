module Report
  class ClassYearQuestionsReport < QuestionsReport

    def initialize study_report
      super 'class_year_question', study_report
    end

    def count_by_time_from_graduation
      @count_by_time_from_graduation ||= create_counter.merge counter_for_field('time_from_graduation_type')
    end

    def relative_by_time_from_graduation
      @relative_by_time_from_graduation ||= calculate_relative_counter count_by_time_from_graduation
    end
  end
end
