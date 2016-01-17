class NotificationsController < ApplicationController

  def send(id)
    @notification = Notification.find(params[:id])
    flash[:notice] = I18n.t(".notification_sending_ok")
    redirect_to '/'
  end

end
