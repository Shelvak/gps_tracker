class DevicesController < ApplicationController
  before_action :set_device, only:  [:show, :edit, :update, :destroy]

  # GET /devices
  def index
    @title = t('view.devices.index_title')
    @devices = Device.all.page(params[:page])
  end

  # GET /devices/1
  def show
    @title = t('view.devices.show_title')
  end

  # GET /devices/new
  def new
    @title = t('view.devices.new_title')
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
    @title = t('view.devices.edit_title')
  end

  # POST /devices
  def create
    @title = t('view.devices.new_title')
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: t('view.devices.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /devices/1
  def update
    @title = t('view.devices.edit_title')

    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: t('view.devices.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_device_url(@device), alert: t('view.devices.stale_object_error')
  end

  # DELETE /devices/1
  def destroy
    @device.disable!

    redirect_to devices_url, notice: t('view.devices.correctly_destroyed')
  end

  private

    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:identifier, :truck_id, :enabled)
    end
end
