class Admin::DashboardsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authorize_super_admin!

  def index
    @enterprises = Enterprise.all
  end

  private

  def authorize_super_admin!
    redirect_to root_path, alert: "Access denied!" unless current_admin.super_admin?
  end
end
