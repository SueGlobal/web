class PasswordResetsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    user.deliver_activation_or_reset_password_instructions! if user


    redirect_to login_path, notice: 'Instructions has been sent to your email.'
  end

  def edit
    @user = User.load_from_reset_password_token(params[:id])

    @token = params[:id]

    not_authenticated unless @user
  end

  def update
    @token = params[:token]
    @user = User.load_from_reset_password_token(@token)

    if @user.nil? || params[:token] != params[:id]
      not_authenticated
    else
      @user.password_confirmation = params[:user][:password_confirmation]

      if @user.change_password! params[:user][:password]
        redirect_to login_path, notice: 'Password successfully updated.'
      else
        render action: 'edit'
      end
    end
  end
end
