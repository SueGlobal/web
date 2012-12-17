module Report
  class FieldWorkQuestionsReport < QuestionsReport

    def initialize study_report
      super 'field_work_question', study_report
    end

    def phone_count
      @phone_count ||= count_boolean_type('phone')
    end

    def email_count
      @email_count ||= count_boolean_type('email')
    end

    def internet_count
      @internet_count ||= count_boolean_type('internet')
    end

    def mail_count
      @mail_count ||= count_boolean_type('mail')
    end

    def interview_count
      @interview_count ||= count_boolean_type('interview')
    end

    def focus_group_count
      @focus_group_count ||= count_boolean_type('focus_group')
    end

    def other_count
      @other_count ||= count_boolean_type('other_check')
    end


    def phone_relative total
      calculate_relative phone_count, total
    end

    def email_relative total
      calculate_relative email_count, total
    end

    def internet_relative total
      calculate_relative internet_count, total
    end

    def mail_relative total
      calculate_relative mail_count, total
    end

    def interview_relative total
      calculate_relative interview_count, total
    end

    def focus_group_relative total
      calculate_relative focus_group_count, total
    end

    def other_relative total
      calculate_relative other_count, total
    end
  end
end
