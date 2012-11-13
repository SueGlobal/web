# -*- encoding : utf-8 -*-
class UniversityChangeRequestController < ApplicationController
  def accept
    UniversityChangeRequest.do_change params[:token]
    respond_to do |format|
      format.html { redirect_to root_path, notice: t2('accept.notice') }
      format.json { head :no_content }
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.university_change_requests'
  end
end
