class Api::ProvincesController < ApplicationController
  def index
    @provinces = Province.eager_load(:city_municipalities).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @provinces, each_serializer: ProvinceSerializer }
    end
  end
end
