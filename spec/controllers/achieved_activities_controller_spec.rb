# -*- encoding : utf-8 -*-
require 'spec_helper'

describe AchievedActivitiesController do
  it_behaves_like "a university dependent model controller", AchievedActivity,
    :index, :show, :new, :edit, :create, :update, :destroy
end
