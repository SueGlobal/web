# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :set_root_breadcrumb
  layout "bootstrap"

  # CanCan related
  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    redirect_to root_url, notice: 'You are not authorized.'
  end

  def not_authenticated
    Rails.logger.info "Someone tried to access without authentication."
    redirect_to root_url, notice: 'You need to log in to access that page.'
  end

  # Record not found
  rescue_from ActiveRecord::RecordNotFound do |exception|
    Rails.logger.info "User: #{current_user} tried to access ..."
    redirect_to root_url, notice: 'Nothing to see here'
  end

  protected
  def set_root_breadcrumb
    add_breadcrumb University.model_name.human(count: 2), root_path
  end

  def set_locale
    if current_user
      I18n.locale = current_user.locale
    else
      I18n.locale = params[:locale] || I18n.locale
    end
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options #{options.inspect}\n"
    {locale: :es}.merge options
  end
end
