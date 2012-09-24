class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    redirect_to root_url, notice: 'You are not authorized.'
  end

  def not_authenticated
    Rails.logger.info "Someone tried to access without authentication."
    redirect_to root_url, notice: 'You need to log in to access that page.'
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.locale
  end
end
