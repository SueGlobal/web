# -*- encoding : utf-8 -*-
class CourseInput < SimpleForm::Inputs::CollectionSelectInput

  def detect_collection_methods
    label, value = options.delete(:label_method), options.delete(:value_method)

    label ||= ->(x) {"#{x}/#{x+1}"}
    value ||= :to_i

    [label, value]
  end

  def collection
    @collection ||= begin
      collection = options.delete(:collection) || build_year_arrays
      collection.respond_to?(:call) ? collection.call : collection.to_a
    end
  end

  protected
  def build_year_arrays
    opts = {start_year: Time.now.year, end_year: APP_CONFIG[:start_year]}.merge options

    opts[:start_year].step(opts[:end_year], (opts[:start_year] > opts[:end_year]) ? -1 : 1)
  end

  def skip_include_blank?
    true
  end
end
