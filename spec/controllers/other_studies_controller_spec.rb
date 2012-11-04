# -*- encoding : utf-8 -*-
require 'spec_helper'

describe OtherStudiesController do

  it_behaves_like "a study controller", OtherStudy,
    :index, :show, :new, :edit, :create, :update, :destroy
end
