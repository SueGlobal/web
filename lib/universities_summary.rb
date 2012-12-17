class UniversitiesSummary

  attr_reader :year

  def initialize year, info_classes=[]
    @year = year
    @info_classes = info_classes
  end

  def universities_count
    University.count
  end

  def universities_with_info_count
    @universities_with_info_count ||= universities_with_info.size
  end

  def universities_with_info
    info_classes.flat_map { |klazz| universities_with_data_for(klazz) }.uniq
  end

  def universities_with_info_relative total
    relative_data(universities_with_info_count, total)
  end

  def universities_with_activity field
    AchievedActivity.year(year).where(field => true).map(&:university_id).uniq
  end

  def universities_with_activity_count field
    @universities_with_activity_count ||= Hash.new do |h,k|
      h[k] = universities_with_activity(k).size
    end
    @universities_with_activity_count[field]
  end

  def universities_with_activity_relative field, total
    relative_data(universities_with_activity_count(field), total)
  end

  protected

  def relative_data partial, total
    if total.zero?
      0
    else
      100 * partial / total
    end
  end

  def universities_with_data_for klazz
    klazz.year(year).map(&:university_id).uniq
  end

  def info_classes
    @info_classes
  end
end
