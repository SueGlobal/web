# -*- encoding : utf-8 -*-
module SorceryMacros

  def behave_as_not_authenticated
    response.should redirect_to(root_path)
    flash.notice.should_not be_blank
  end
end
