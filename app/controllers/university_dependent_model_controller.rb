# -*- encoding : utf-8 -*-
class UniversityDependentModelController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  load_and_authorize_resource :university, except: [:index]

  class << self
    def dependent_model model_name
      load_and_authorize_resource model_name.to_sym, through: :university,
        shallow: true, except: [:index], singleton: true
      before_filter :load_university, only: [:index]
      before_filter :decorate_university
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
    end
  end

  protected
  def decorate_university
    @university = UniversityDecorator.decorate @university
  end

  def load_university
    @university = University.find(params[:university_id])
  end
end
