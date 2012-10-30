class ExpandableCheckboxInput < SimpleForm::Inputs::BooleanInput

  def input
    build_check_box_with_label + build_label_with_text_area
  end

  private

  def build_check_box_with_label
    template.label_tag(nil, :class => 'checkbox') do
      build_check_box + inline_label_for_check_box
    end
  end

  def build_check_box
    input_html_options[:class] = [input_html_options[:class], "js-other-change"].flatten.join(' ')
    @builder.check_box(check_attribute_name, input_html_options, checked_value, unchecked_value)
  end

  def inline_label_for_check_box
    @builder.label check_attribute_name
  end

  def build_label_with_text_area
    template.content_tag(:div, :class => "js-other-collapsable other-description") do
      @builder.label(attribute_name) + "<br>".html_safe + @builder.text_area(attribute_name)
    end
  end

  def check_attribute_name
    "#{attribute_name}_check"
  end

  def checked_value
    options.fetch(:checked_value, '1')
  end

  def unchecked_value
    options.fetch(:unchecked_value, '0')
  end
end
