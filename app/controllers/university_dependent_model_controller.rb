# -*- encoding : utf-8 -*-
class UniversityDependentModelController < ApplicationController
  before_filter :set_universities_breadcrumb
  before_filter :require_login, except: [:index, :show]

  load_and_authorize_resource :university, except: [:index], find_by: :slug

  class << self
    def dependent_model model_name, with_show=true
      load_and_authorize_resource model_name.to_sym, through: :university,
        shallow: true, except: [:index], singleton: true, find_by: :slug

      # Loading University
      before_filter :load_university, only: [:index]
      before_filter only: [:edit, :update, :show, :destroy] do |controller|
        resource = controller.instance_variable_get(:"@#{model_name}")
        controller.instance_variable_set(:"@university", resource.university)
      end

      before_filter :decorate_university

      # Load path
      before_filter only: [:new, :create] do |controller|
        path = ["university", model_name.to_s].map do |field|
          controller.instance_variable_get(:"@#{field}")
        end
        controller.instance_variable_set :@path, path
      end

      before_filter only: [:edit, :update] do |controller|
        path = controller.instance_variable_get(:"@#{model_name}")
        controller.instance_variable_set :@path, path
      end

      # Breadcrumbs
      before_filter do |controller|
        university = controller.instance_variable_get(:@university)
        add_breadcrumb university.abbreviation, university_path(university)
      end

      if with_show
        before_filter only: [:show, :destroy, :edit, :update] do |controller|
          resource = controller.instance_variable_get(:"@#{model_name}")
          add_breadcrumb eval(model_name.to_s.camelize).model_name.human(count: 1), resource
        end
      end
    end
  end

  protected
  def decorate_university
    @university = UniversityDecorator.decorate @university
  end

  def load_university
    @university = University.find(params[:university_id])
  end

  def set_universities_breadcrumb
    add_breadcrumb University.model_name.human(count: 2), root_path
  end
end
