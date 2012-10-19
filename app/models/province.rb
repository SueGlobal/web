# -*- encoding : utf-8 -*-
class Province < ActiveRecord::Base
  attr_accessible :name

  def self.for_select
    order('id_prov ASC').map do |p|
      ["#{sprintf('%0#2d', p.id_prov)} - #{p.name}", p.id]
    end
  end
end
