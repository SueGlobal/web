# -*- encoding : utf-8 -*-
module SamplesHelper

  def period_for_sample sample
    case sample.periodicity.periodicity_type
    when :no_periodicity
     sample.taken_at
    when :other
     sample.taken_at
    else
     "#{format_date(sample.taken_at)} - #{format_date(sample.taken_at + sample.periodicity.as_time)}"
    end
  end

  def format_date(date)
    date.strftime('%m-%Y')
  end
end
