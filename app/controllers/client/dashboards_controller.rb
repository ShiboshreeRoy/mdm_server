class Client::DashboardsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authorize_client!

  def index
    # client_admin is linked to one enterprise
    @enterprise = current_admin.enterprise
    @devices = @enterprise.devices
  end

  private

  def authorize_client!
    redirect_to root_path, alert: "Access denied!" unless current_admin.client_admin?
  end
end
