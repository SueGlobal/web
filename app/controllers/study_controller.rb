# -*- encoding : utf-8 -*-
class StudyController < UniversityDependentModelController

  class << self
    def dependent_model model_name, with_show=true
      super model_name, with_show
      before_filter only: :index do |controller|
        controller.instance_variable_set :@title, model_name.to_s.singularize.camelize.constantize.model_name.human(count: 2)
      end
    end
  end
end
