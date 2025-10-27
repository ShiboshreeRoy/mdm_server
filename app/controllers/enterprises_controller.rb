class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: %i[show edit update destroy]

  def index
    @enterprises = Enterprise.all
  end

  def show
    @devices = @enterprise.devices
  end

  def new
    @enterprise = Enterprise.new
  end

  def create
    @enterprise = Enterprise.new(enterprise_params)
    if @enterprise.save
      redirect_to @enterprise, notice: "Enterprise created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @enterprise.update(enterprise_params)
      redirect_to @enterprise, notice: "Enterprise updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @enterprise.destroy
    redirect_to enterprises_path, notice: "Enterprise deleted."
  end

  private

  def set_enterprise
    @enterprise = Enterprise.find(params[:id])
  end

  def enterprise_params
    params.require(:enterprise).permit(:name, :provider, credentials: {})
  end
end
