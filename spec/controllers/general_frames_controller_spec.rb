# -*- encoding : utf-8 -*-
require 'spec_helper'

describe GeneralFramesController do
  it_behaves_like "a university dependent model controller", GeneralFrame,
    :index, :show, :new, :edit, :create, :update, :destroy
end
