# -*- encoding : utf-8 -*-
module GeneralFramesHelper

  def numeric_field_for(field, form)
    content_tag :div, :class => 'field' do
      concat form.label(field)
      concat form.number_field(field, min: 0)
    end
  end
end
