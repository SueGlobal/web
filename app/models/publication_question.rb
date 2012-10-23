# -*- encoding : utf-8 -*-
class PublicationQuestion < ActiveRecord::Base
  belongs_to :information_question
  attr_accessible :app_check, :dynamic_web_check,
                  :dynamic_web_url, :limited_distribution_check,
                  :multimedia_check, :other_check, :other,
                  :papers_check, :pdf_check, :static_web_check,
                  :static_web_url, :thesis_check, :with_isbn_check,
                  :without_isbn_check
end
