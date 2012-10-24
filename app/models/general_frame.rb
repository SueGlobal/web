# -*- encoding : utf-8 -*-
class GeneralFrame < ActiveRecord::Base
  belongs_to :university

  GRADUATES = [:degree_graduates, :bachelors_degree_graduates, :graduates,
        :master_graduates, :phd_graduates, :specific_qualifications_graduates]

  QUALIFICATIONS = [:number_of_qualifications, :number_of_masters_degree,
        :number_of_phds, :number_of_specific_qualifications]

  attr_accessible *GRADUATES
  attr_accessible *QUALIFICATIONS
  attr_accessible *(GRADUATES.map {|x| :"#{x}_check"})
  attr_accessible *(QUALIFICATIONS.map {|x| :"#{x}_check"})

  attr_accessible :year, :number_of_campus,
    :number_of_campus_check

  (GRADUATES | QUALIFICATIONS | [:number_of_campus]).each do |grad_field|
    attr_accessible grad_field

    validates grad_field,
      presence: true,
      numericality: { only_integer: true,
                      greater_than_or_equal_to: 0,
                      :if => (-> { self[:"#{grad_field}_check"] })}
  end

  validates :year,
    numericality: {only_integer: true, greater_than_or_equal_to: 0},
    presence: true

  def any_graduate_data?
    GRADUATES.map{|field| self[:"#{field}_check"]}.any?
  end

  def any_qualification_data?
    QUALIFICATIONS.map{|field| self[:"#{field}_check"]}.any?
  end
end
