# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PublicSourceStudiesController do

  it_behaves_like "a study controller", PublicSourceStudy,
    :index, :show, :new, :edit, :create, :update, :destroy
end
