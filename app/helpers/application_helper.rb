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
end
