class Api::RegionsController < ApplicationController
  def index
    @regions = Region.eager_load(:provinces,:districts).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions, each_serializer: RegionSerializer }
    end
  end
end