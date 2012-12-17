# -*- encoding : utf-8 -*-
class Sample < ActiveRecord::Base
  belongs_to :index
  belongs_to :periodicity
  belongs_to :source
  has_and_belongs_to_many :segments
  has_many :sample_values
  accepts_nested_attributes_for :sample_values
  attr_accessible :methodology_url, :taken_at, :sample_values_attributes
  accepts_nested_attributes_for :periodicity
  attr_accessible :periodicity_attributes

  def value_for *variables
    value = sample_values.find do |sv|
      variables.all? do |v|
        sv.segmentation_variable_values.include? v
      end
    end

    value || new_value_for(*variables)
  end

  def new_value_for *variables
    SampleValue.new.tap do |s|
      s.sample = self
      s.segmentation_variable_values.push *variables
    end
  end

  def interval
    periodicity_type = periodicity.periodicity_type.to_sym
    case periodicity_type
    when :no_periodicity
      single_date_interval
    when :other
      single_date_interval
    when :monthly
      single_date_interval
    else
      two_dates_interval
    end
  end

  class << self
    def from_index index
      Sample.new.tap do |obj|
        obj.source = index.source
        obj.periodicity = index.periodicity
        obj.methodology_url = index.methodology_url
        obj.index = index
        obj.segments = index.segments
      end
    end
  end

  extend FriendlyId
  friendly_id :name_for_slug, use: :slugged

  def should_generate_new_friendly_id?
    new_record? || self[:slug].blank?
  end

  def name_for_slug
    "#{index.name} #{taken_at.strftime('%d-%m-%Y')}"
  end

  def to_key
    [slug]
  end

  protected
  def format_date(date)
    date.strftime('%m-%Y')
  end

  def single_date_interval
    "#{format_date(taken_at)} (#{Periodicity.translate_option(periodicity.periodicity_type)})"
  end

  def two_dates_interval
    "#{format_date(taken_at)} - #{format_date(taken_at + periodicity.as_time - 1.month)}"
  end
end
