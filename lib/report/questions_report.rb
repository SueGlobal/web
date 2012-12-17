module Report
  class QuestionsReport

    attr_reader :study_report, :type_of_question

    def initialize type_of_question, study_report
      @type_of_question = type_of_question
      @study_report = study_report
    end

    def exists_for_study?
      study_report.contains_question? type_of_question
    end

    def table_name
      @table_name ||= type_of_question + "s"
    end

    def count_boolean_type field, value=true
      select_questions.where("#{table_name}.#{field}" => value).count
    end

    def count_empty_string field
      questions.map(&(field.to_sym)).reject(&:blank?).size
    end

    def create_counter
      Hash.new do |h,k|
        h[k] = 0
      end
    end

    def counter_for_field field
      questions.each_with_object(create_counter) do |q, counter|
        counter[q.send(field)] += 1
      end
    end

    def questions
      @questions ||= select_questions.map(&(type_of_question.to_sym))
    end

    def select_questions
      study_report.select_studies.includes(type_of_question)
    end

    def calculate_relative partial, total
      if total.zero?
        0
      else
        100 * partial / total
      end
    end
  end
end
