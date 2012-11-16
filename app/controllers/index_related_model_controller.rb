# -*- encoding : utf-8 -*-
class IndexRelatedModelController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  class << self
    def related_model model_name, with_show=true
      load_and_authorize_resource model_name.to_sym, except: [:index], find_by: :slug

      before_filter do |controller|
        add_breadcrumb model_name.to_s.camelize.constantize.model_name.human(count: 2), polymorphic_path(model_name.to_s.pluralize.underscore.to_sym)
      end
    end
  end
end
