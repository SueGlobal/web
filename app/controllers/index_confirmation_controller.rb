class IndexConfirmationController < ApplicationController
  before_filter :set_confirmation

  def confirm
    @confirmation.confirm
    redirect_to root_path, notice: t2('confirm.notice')
  end

  def reject
    @confirmation.reject
    redirect_to root_path, notice: t2('reject.notice')
  end

  protected
  def set_confirmation
    @confirmation = IndexConfirmation.find_by_slug params[:slug]
    binding.pry
    if @confirmation.nil? || !@confirmation.active?
      redirect_to root_path, notice: t2('set_confirmation.not_available')
    end
  end

  def t2 path
    I18n.t path, scope: 'controllers.index_confirmation'
  end
end
