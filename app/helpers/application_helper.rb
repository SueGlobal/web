# -*- encoding : utf-8 -*-
module ApplicationHelper

  def user_link url, options={}
    action_link :user, url, options
  end
  def show_link url, options={}
    action_link :show, url, options
  end

  def edit_link url, options={}
    action_link :edit, url, options
  end

  def destroy_link url, options={}
    action_link :destroy, url, options
  end

  def new_link url, options={}
    action_link :new, url, options
  end

  def action_link action, url, options
    add_action_as_class action, options
    link_to content_action(action),
            url,
            options
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_form", f: builder)
    end
    link_to name, '#',
            "class" => "btn add_fields add_#{association.to_s.singularize}",
            data: {id: id, fields: fields.gsub("\n", "")}
  end

  def boolean_value text, value
    render  partial: 'boolean_field',
            locals: { text: text,
                      value: value ? "true" : "false" }
  end

  def select_years f, field, opts={}
    f.select field, years_for_select(opts)
  end

  def year_collection_for_select opts={}
    options = {start_year: Time.now.year, end_year: APP_CONFIG[:start_year], course: false}
    opts = options.merge opts

    opts[:start_year].step(opts[:end_year], (opts[:start_year] > opts[:end_year]) ? -1 : 1)
  end

  def years_for_select opts={}
    year_collection_for_select.map do |x|
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

  protected
  def content_action action
    content_tag :i,"", title: I18n.t("actions.#{action}"), :class => i_class_for(action)
  end

  def i_class_for action
    {edit: "icon-edit", destroy: "icon-remove", show: "icon-info-sign",
     new: "icon-plus-sign", user: 'icon-user'}[action.to_sym]
  end

  def add_action_as_class action, options
    unless options[:class] && options[:class].include?(action.to_s)
      options[:class] = "#{action} #{options[:class]}"
    end
  end
end
