module Report
  class PublicationQuestionsReport < QuestionsReport

    attr_reader :information_questions_report

    def initialize study_report
      super 'publication_question', study_report
      @information_questions_report = InformationQuestionsReport.new study_report
    end

    def university_government_count
      information_questions_report.university_government_count
    end

    def university_government_relative
      information_questions_report.university_government_relative
    end

    def social_council_count
      information_questions_report.social_council_count
    end

    def social_council_relative
      information_questions_report.social_council_relative
    end

    def faculties_management_count
      information_questions_report.faculties_management_count
    end

    def faculties_management_relative
      information_questions_report.faculties_management_relative
    end

    def students_count
      information_questions_report.students_check_count
    end

    def students_relative
      information_questions_report.students_check_relative
    end

    def prestudent_count
      information_questions_report.prestudent_count
    end

    def prestudent_relative
      information_questions_report.prestudent_relative
    end

    def counselor_count
      information_questions_report.counselor_count
    end

    def counselor_relative
      information_questions_report.counselor_relative
    end

    def students_parents_count
      information_questions_report.students_parents_count
    end

    def students_parents_relative
      information_questions_report.students_parents_relative
    end

    def society_count
      information_questions_report.society_count
    end

    def society_relative
      information_questions_report.society_relative
    end

    def employers_count
      information_questions_report.employers_count
    end

    def employers_relative
      information_questions_report.employers_relative
    end

    def public_administrations_count
      information_questions_report.public_administrations_count
    end

    def public_administrations_relative
      information_questions_report.public_administrations_relative
    end

    def with_isbn_count
      @with_isbn_count ||= count_boolean_type "with_isbn_check"
    end

    def with_isbn_relative total
      calculate_relative with_isbn_count, total
    end

    def without_isbn_count
      @without_isbn_count ||= count_boolean_type "without_isbn_check"
    end

    def without_isbn_relative total
      calculate_relative without_isbn_count, total
    end

    def limited_distribution_count
      @limited_distribution_count ||= count_boolean_type "limited_distribution_check"
    end

    def limited_distribution_relative total
      calculate_relative limited_distribution_count, total
    end

    def static_web_count
      @static_web_count ||= count_boolean_type "static_web_check"
    end

    def static_web_relative total
      calculate_relative static_web_count, total
    end

    def dynamic_web_count
      @dynamic_web_count ||= count_boolean_type "dynamic_web_check"
    end

    def dynamic_web_relative total
      calculate_relative dynamic_web_count, total
    end

    def pdf_count
      @pdf_count ||= count_boolean_type "pdf_check"
    end

    def pdf_relative total
      calculate_relative pdf_count, total
    end

    def multimedia_count
      @multimedia_count ||= count_boolean_type "multimedia_check"
    end

    def multimedia_relative total
      calculate_relative multimedia_count, total
    end

    def app_count
      @app_count ||= count_boolean_type "app_check"
    end

    def app_relative total
      calculate_relative app_count, total
    end

    def papers_count
      @papers_count ||= count_boolean_type "papers_check"
    end

    def papers_relative total
      calculate_relative papers_count, total
    end

    def thesis_count
      @thesis_check ||= count_boolean_type "thesis_check"
    end

    def thesis_relative total
      calculate_relative thesis_count, total
    end

    def other_count
      @other_count ||= count_boolean_type "other_check"
    end

    def other_relative total
      calculate_relative other_count, total
    end
  end
end