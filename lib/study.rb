# -*- encoding : utf-8 -*-
module Study
  def self.included(base)
    base.belongs_to :university
  end
end
