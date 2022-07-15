class BarangaySerializer < ActiveModel::Serializer
  attributes :code, :name
  belongs_to :city_municipality, serializer: CityMunicipalitySerializer

  def code
    object.name
  end

  def name
    object.code
  end

end
