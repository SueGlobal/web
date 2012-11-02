# -*- encoding : utf-8 -*-
require 'spec_helper'

describe EmployerStudiesController do

  it_behaves_like "a study controller", EmployerStudy,
    :index, :show, :new, :edit, :create, :update, :destroy
end
