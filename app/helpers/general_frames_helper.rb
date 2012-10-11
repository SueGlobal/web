# -*- encoding : utf-8 -*-
module GeneralFramesHelper

  def numeric_field_for(field, form)
    content_tag :div, :class => 'field' do
      concat form.label(field)
      concat form.number_field(field, min: 0)
    end
  end

  def data_for(resource, field)
    content_tag :li, :class => 'field' do
      concat content_tag :span, GeneralFrame.human_attribute_name(field), :class => 'label'
      concat content_tag :span, resource.send(field), :class => 'data'
    end
  end
end
