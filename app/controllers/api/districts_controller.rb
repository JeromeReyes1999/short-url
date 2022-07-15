class Api::DistrictsController < ApplicationController
  def index
    @districts = District.eager_load(:city_municipalities).all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @districts, each_serializer: DistrictSerializer }
    end
  end
end
