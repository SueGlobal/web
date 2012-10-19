# -*- encoding : utf-8 -*-
require 'spec_helper'

describe StudentStudiesController do

  it_behaves_like "a study controller", StudentStudy,
    :index, :show, :new, :edit, :create, :update, :destroy
end
