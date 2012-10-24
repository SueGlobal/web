# -*- encoding : utf-8 -*-
module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_form", f: builder)
    end
    link_to name, '#',
            "class" => "add_fields add_#{association.to_s.singularize}",
            data: {id: id, fields: fields.gsub("\n", "")}
  end

  def select_years f, field, opts={}
    options = {start_year: Time.now.year, end_year: APP_CONFIG[:start_year], course: false}
    options.merge! opts

    f.select field, years_for_select(options)
  end

  def years_for_select opts
    opts[:start_year].step(opts[:end_year], (opts[:start_year] > opts[:end_year]) ? -1 : 1).map do |x|
      [format_for_year(x, opts[:course]), x]
    end
  end

  def format_for_year year, is_course=false
    if is_course
      "#{year}/#{year+1}"
    else
      "#{year}"
    end
  end
end
