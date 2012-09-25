# -*- encoding : utf-8 -*-
class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:email], params[:password], params[:remember_me])
        format.html { redirect_back_or_to root_path, notice: t2('create.login.ok') }
      else
        format.html { flash.now[:alert] = t2('create.login.fail'); render action: 'new' }
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t2('destroy.logout')
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.user_sessions'
  end
end
