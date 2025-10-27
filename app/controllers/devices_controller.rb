class DevicesController < ApplicationController
  before_action :set_enterprise
  before_action :set_device, only: [:show]

  def index
    @devices = @enterprise.devices
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
    @enterprise = Enterprise.find(params[:enterprise_id])
  end

  def set_device
    @device = @enterprise.devices.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:device_id, :platform, :enrolled, :metadata)
  end
end
