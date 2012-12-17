module Report
  class FundingQuestionsReport < QuestionsReport

    def initialize study_report
      super 'funding_question', study_report
    end

    def fixed_state_count
      @fixed_state_count ||= count_boolean_type('fixed_state_funding')
    end

    def variable_state_count
      @variable_state_count || count_boolean_type('variable_state_funding')
    end

    def fixed_private_count
      @fixed_private_count ||= count_boolean_type('fixed_private_funding')
    end

    def variable_private_count
      @variable_private_count || count_boolean_type('variable_private_funding')
    end
  end
end
