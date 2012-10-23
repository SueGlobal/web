# -*- encoding : utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :publication_question do
    information_question nil
    with_isbn_check false
    without_isbn_check false
    limited_distribution_check false
    static_web_check false
    static_web_url "MyText"
    dynamic_web_check false
    dynamic_web_url "MyText"
    pdf_check false
    multimedia_check false
    app_check false
    papers_check false
    thesis_check false
    other_check false
    other "MyText"
  end
end
