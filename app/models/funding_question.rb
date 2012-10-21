# -*- encoding : utf-8 -*-
class FundingQuestion < ActiveRecord::Base
  belongs_to :studiable, polymorphic: true
  attr_accessible :fixed_private_funding, :fixed_state_funding, :variable_private_funding, :variable_state_funding
end
