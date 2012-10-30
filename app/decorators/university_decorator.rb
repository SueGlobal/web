# -*- encoding : utf-8 -*-
class UniversityDecorator < Draper::Base
  decorates :university

  # Accessing Helpers
  #   You can access any helper via a proxy
  #
  #   Normal Usage: helpers.number_to_currency(2)
  #   Abbreviated : h.number_to_currency(2)
  #
  #   Or, optionally enable "lazy helpers" by including this module:
  #     include Draper::LazyHelpers
  #   Then use the helpers with no proxy:
  #     number_to_currency(2)

  # Defining an Interface
  #   Control access to the wrapped subject's methods using one of the following:
  #
  #   To allow only the listed methods (whitelist):
  #     allows :method1, :method2
  #
  #   To allow everything except the listed methods (blacklist):
  #     denies :method1, :method2

  # Presentation Methods
  #   Define your own instance methods, even overriding accessors
  #   generated by ActiveRecord:
  #
  #   def created_at
  #     h.content_tag :span, attributes["created_at"].strftime("%a %m/%d/%y"),
  #                   :class => 'timestamp'
  #   end

  def general_frame_years
    @general_frame_years ||= GeneralFrame.where(university_id: university.id).order('year ASC').uniq.pluck(:year)
  end

  def miss_general_frame_years general_frame=nil
    @miss_general_frame_years ||= (2000..Time.zone.now.year).to_a - general_frame_years
    if general_frame && general_frame.year
      (@miss_general_frame_years | [general_frame.year]).sort
    else
      @miss_general_frame_years
    end
  end

  def general_frame_academic_years
    general_frame_years.map { |y| to_academic_course(y) }
  end

  def miss_general_frame_academic_years_for_select
    miss_general_frame_academic_years.zip miss_general_frame_years
  end

  def miss_general_frame_academic_years
    miss_general_frame_years.map { |y| to_academic_course(y) }
  end

  def to_academic_course year
    "#{year}/#{year-1999}"
  end

  def province_name
    if university.province
      university.province.name
    else
      h.content_tag :em, I18n.t('university_decorator.no_province_name')
    end
  end
end
