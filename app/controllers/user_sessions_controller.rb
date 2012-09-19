class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      if @user = login(params[:email], params[:password], params[:remember_me])
        format.html { redirect_back_or_to root_path, notice: 'Login successful.' }
      else
        format.html { flash.now[:alert] = 'Login failed.'; render action: 'new' }
      end
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end
