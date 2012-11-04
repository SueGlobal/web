# -*- encoding : utf-8 -*-
require 'spec_helper'

describe DatabaseStudiesController do

  it_behaves_like "a study controller", DatabaseStudy,
    :index, :show, :new, :edit, :create, :update, :destroy
end
