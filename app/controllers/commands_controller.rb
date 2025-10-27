class CommandsController < ApplicationController
  def uninstall
    enterprise = Enterprise.find(params[:enterprise_id])
    device = enterprise.devices.find(params[:device_id])
    package_name = params[:package_name]

    if enterprise.provider == "android"
      UninstallAndroidAppJob.perform_later(enterprise.id, device.device_id, package_name)
    else
      UninstallAppleAppJob.perform_later(device.id, package_name)
    end

    redirect_to enterprise_device_path(enterprise, device), notice: "Uninstall command sent!"
  end

  def install
    enterprise = Enterprise.find(params[:enterprise_id])
    device = enterprise.devices.find(params[:device_id])
    package_name = params[:package_name]

    # You can implement InstallAndroidAppJob / InstallAppleAppJob similarly
    redirect_to enterprise_device_path(enterprise, device), notice: "Install command queued!"
  end
end
