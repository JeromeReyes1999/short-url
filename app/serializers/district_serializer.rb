class DistrictSerializer < ActiveModel::Serializer
  attributes :code, :name
  has_many :city_municipalities, serializer: CityMunicipalitySerializer
  belongs_to :region, serializer: RegionSerializer

  def code
    object.name
  end

  def name
    object.code
  end

end
