class UniversityUsersController < ApplicationController

  before_filter :load_university
  before_filter :add_university_breadcrumb

  def index
    authorize! :index_university_users, @university
    @users = @university.users
  end

  def destroy
    authorize! :destroy_university_users, @university
    @user = @university.users.find(params[:id])

    UniversityChangeRequest.remove_user @user

    @user.university = nil

    respond_to do |format|
      if @user != current_user && @user.save
        format.html { redirect_to university_users_path, notice: t2('destroy.notice') }
        format.js { render partial: 'destroy_animation', locals: {resource: @user}}
      else
        format.html { redirect_to university_users_path, alert: t2('destroy.alert') }
        format.js { render partial: 'destroy.fail'}
      end
    end
  end

  private

  def add_university_breadcrumb
    add_breadcrumb University.model_name.human(count: 2), universities_path
    add_breadcrumb @university.abbreviation, university_path(@university)
    add_breadcrumb User.model_name.human(count: 2), university_users_path
  end

  def load_university
    @university = University.find(params[:university_id])
  end

  def t2 path
    I18n.t path, scope: 'controllers.university_users'
  end
end
