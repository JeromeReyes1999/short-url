class Api::CityMunicipalitiesController < ApplicationController
  def index
    @city_municipalities = CityMunicipality.eager_load(:barangays).all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @city_municipalities, each_serializer: CityMunicipalitySerializer }
    end
  end
end
