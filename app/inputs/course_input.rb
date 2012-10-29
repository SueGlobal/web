class CourseInput < SimpleForm::Inputs::CollectionSelectInput

  def detect_collection_methods
    label, value = options.delete(:label_method), options.delete(:value_method)

    label ||= ->(x) {"#{x}/#{x+1}"}
    value ||= :to_i

    [label, value]
  end

  def collection
    opts = {start_year: Time.now.year, end_year: APP_CONFIG[:start_year]}.merge options

    opts[:start_year].step(opts[:end_year], (opts[:start_year] > opts[:end_year]) ? -1 : 1)
  end

  def skip_include_blank?
    true
  end
end
