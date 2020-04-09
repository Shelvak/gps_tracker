class LocationsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  before_action :authenticate_device!, only: :create


  # GET /locations
  def index
    @title = t('view.locations.index_title')
    @locations = Location.all.page(params[:page])
  end

  # POST /locations
  def create
    @location = Location.create(location_params)

    respond_to do |format|
      format.json { head :ok }
    end
  rescue
    respond_to do |format|
      format.json { head :ok }
    end
  end

  private
    def location_params
      params.permit(:latitude, :longitude, :device_identifier, :taken_at)
    end

    def authenticate_device!
      # Change for auth_token + identifier
      unless Device.find_by(identifier: params[:device_identifier]).try(:auth?)
        respond_to do |format|
          format.json { head :unprocessable_entity }
        end
      end
    end
end
