# -*- encoding : utf-8 -*-
class UniversityDependentModelController < ApplicationController
  before_filter :require_login, except: [:index, :show]

  load_and_authorize_resource :university, except: [:index]

  class << self
    def dependent_model model_name
      load_and_authorize_resource model_name.to_sym, through: :university,
        shallow: true, except: [:index], singleton: true
    end
  end
end
