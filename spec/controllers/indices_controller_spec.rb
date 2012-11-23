# -*- encoding : utf-8 -*-
require 'spec_helper'

describe IndicesController do

  it_behaves_like 'an index related model controller', Index,
    :index, :show, :new, :edit, :create, :update, :destroy
end
