class Client::DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_client!

  def index
    @enterprise = current_user.enterprise
    @devices = @enterprise ? @enterprise.devices : []
  end

  private

  def authorize_client!
    redirect_to root_path, alert: "Access denied!" unless current_user
  end
end
