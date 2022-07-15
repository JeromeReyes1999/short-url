class Api::BarangaysController < ApplicationController
  def index
    @barangays = Barangay.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @barangays, each_serializer: BarangaySerializer }
    end
  end
end
