class Report::StudyReport

  attr_reader :klazz, :year
  def initialize klazz, year
    @klazz = klazz
    @year = year
  end

  def universities
    @universities ||= select_studies.includes(:university).order('universities.name_for_order ASC').select(:university_id).uniq.map(&:university)
  end

  def select_studies
    klazz.year(year)
  end

  def studies
    @studies ||= select_studies.all
  end

  def contains_question? type
    klazz.questions.include? type.to_sym
  end
end
