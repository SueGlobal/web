require 'spec_helper'

describe SourcesController do

  it_behaves_like "an index related model controller", Source,
    :index, :show, :new, :edit, :create, :update, :destroy
end
