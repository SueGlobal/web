class GeneralFrameEvolution
  attr_reader :university

  def initialize university
    @university = university
  end

  def general_frames
    @general_frames ||= university.general_frames.sort_by(&:year)
  end

  def range
    @range = first_year..last_year
  end

  def first_year
    years.first
  end

  def last_year
    years.last
  end

  def years
    @years ||= general_frames.map(&:year)
  end

  def graduates_legend_row
    legend_row_for_columns GeneralFrame::GRADUATES
  end

  def qualifications_legend_row
    legend_row_for_columns GeneralFrame::QUALIFICATIONS
  end

  def graduates_data_for_year year
    data_row_for_year year, GeneralFrame::GRADUATES
  end

  def qualifications_data_for_year year
    data_row_for_year year, GeneralFrame::QUALIFICATIONS
  end

  def graduates_data_table
    [graduates_legend_row] + first_year.upto(last_year).map do |year|
      graduates_data_for_year year
    end
  end

  def qualifications_data_table
    [qualifications_legend_row] + first_year.upto(last_year).map do |year|
      qualifications_data_for_year year
    end
  end

  protected
  def legend_row_for_columns columns
    [GeneralFrame.human_attribute_name(:year)] + columns.map do |column|
      GeneralFrame.human_attribute_name column
    end
  end

  def data_row_for_year year, columns
    frame = general_frame_for_year year
    [year.to_s] + columns.map do |column|
      frame.send column
    end
  end

  def general_frame_for_year year
    general_frames.find{|f| f.year == year} || EmptyGeneralFrame.new
  end
end

class EmptyGeneralFrame
  def method_missing *args
    nil
  end
end
