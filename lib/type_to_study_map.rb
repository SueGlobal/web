# -*- encoding : utf-8 -*-
class TypeToStudyMap

  def initialize map={}
    @map = self.class.default_map.merge map
  end

  def select_by_type type
    if @map.has_key? type.to_sym
      @map[type.to_sym].includes(:basic_question, :university).order('basic_questions.year DESC, basic_questions.title ASC, universities.name_for_order ASC')
    else
      nil
    end
  end

  def title_for_type type
    if @map.has_key? type.to_sym
      @map[type.to_sym].model_name.human(count: 2)
    end
  end

  class << self

    def default_map
      {
        student: StudentStudy,
        employer: EmployerStudy,
        public_source: PublicSourceStudy,
        agreement: AgreementSourceStudy,
        database: DatabaseStudy,
        other: OtherStudy
      }
    end
  end
end
