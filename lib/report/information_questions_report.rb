module Report
  class InformationQuestionsReport < QuestionsReport

    def initialize study_report
      super 'information_question', study_report
    end

    def university_government_count
      @university_government_count ||= count_boolean_type "university_government_check"
    end

    def university_government_relative total
      calculate_relative university_government_count, total
    end

    def social_council_count
      @social_council_count ||= count_boolean_type "social_council_check"
    end

    def social_council_relative
      calculate_relative social_council_count, total
    end

    def faculties_management_count
      @faculties_management_count ||= count_boolean_type "faculties_management_check"
    end

    def faculties_management_relative total
      calculate_relative faculties_management_count, total
    end

    def students_count
      @students_check_count ||= count_boolean_type "students_check"
    end

    def students_relative total
      calculate_relative students_count, total
    end

    def prestudent_count
      @prestudent_count ||= count_boolean_type "prestudent_check"
    end

    def prestudent_relative total
      calculate_relative prestudent_count, total
    end

    def counselor_count
      @counselor_count ||= count_boolean_type "counselor_check"
    end

    def counselor_relative total
      calculate_relative counselor_count, total
    end

    def students_parents_count
      @students_parents_count ||= count_boolean_type "students_parents_check"
    end

    def students_parents_relative total
      calculate_relative students_parents_count, total
    end

    def society_count
      @society_count ||= count_boolean_type "society_check"
    end

    def society_relative total
      calculate_relative society_count, total
    end

    def employers_count
      @employers_count ||= count_boolean_type "employers_check"
    end

    def employers_relative total
      calculate_relative employers_count, total
    end

    def public_administrations_count
      @public_administrations_count ||= count_boolean_type "public_administrations_check"
    end

    def public_administrations_relative total
      calculate_relative public_administrations_count, total
    end
  end
end