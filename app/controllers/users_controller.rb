# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  load_and_authorize_resource except: [:new, :create, :activate]
  before_filter :require_login, except: [:new, :create, :activate]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # Loaded by cancan
    # @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    # Initialized by cancan
    # @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: t2('create.notice')}
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # Initialized by cancan
    # @user = User.find(params[:id])
    params[:user][:email] = @user.email if params[:user][:email] && !current_user.god?

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: t2('update.notice') }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # Initialized by cancan
    # @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  # GET /users/9m2p2nsqhybTF9mMKLvX/activate
  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to login_path, notice: t2('activate.notice')
    else
      not_authenticated
    end
  end

  protected
  def t2 path
    I18n.t path, scope: 'controllers.users'
  end
end
