# -*- encoding : utf-8 -*-
module LoginMacros

  def login_with email, password, remember=true, save_and_open_page_after_fill=false
    visit root_path
    within 'form.signin' do
      find('.js-email').set email
      find('.js-password').set password
      find('.js-remember').set remember
      save_and_open_page if save_and_open_page_after_fill
      find('.js-submit').click
    end
  end
end
