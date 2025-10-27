class DevicesController < ApplicationController
  before_action :set_enterprise, except: [:all_devices]  # optional route to list all devices
  before_action :set_device, only: [:show]

  # List devices for a specific enterprise
  def index
    if @enterprise
      @devices = @enterprise.devices
    else
      redirect_to enterprises_path, alert: "Please select an enterprise first."
    end
  end

  # Optional: list all devices across enterprises
  def all_devices
    @devices = Device.all
  end

  def show; end

  def new
    @device = @enterprise.devices.new
  end

  def create
    @device = @enterprise.devices.new(device_params)
    if @device.save
      redirect_to enterprise_devices_path(@enterprise), notice: "Device enrolled successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_enterprise
    if params[:enterprise_id].present?
      @enterprise = Enterprise.find(params[:enterprise_id])
    else
      @enterprise = nil
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to enterprises_path, alert: "Enterprise not found."
  end

  def set_device
    @device = @enterprise.devices.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to enterprise_devices_path(@enterprise), alert: "Device not found."
  end

  def device_params
    params.require(:device).permit(:device_id, :platform, :enrolled, :metadata)
  end
end
