# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AgreementSourceStudiesController do

  it_behaves_like "a study controller", AgreementSourceStudy,
    :index, :show, :new, :edit, :create, :update, :destroy
end
