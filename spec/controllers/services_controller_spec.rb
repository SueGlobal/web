# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ServicesController do
  it_behaves_like "a university dependent model controller", Service,
    :index, :new, :edit, :create, :update, :destroy
end
