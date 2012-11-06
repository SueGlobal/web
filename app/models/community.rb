# -*- encoding : utf-8 -*-
class Community < ActiveRecord::Base

  def self.for_select
    order('name ASC').map do |p|
      [p.name, p.id]
    end
  end
end
