# -*- encoding : utf-8 -*-
module CancanMacros

  def behave_as_unauthorized
    response.should redirect_to(root_path)
    flash.notice.should_not be_nil
  end
end
