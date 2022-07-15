class RegionSerializer < ActiveModel::Serializer
  attributes :code, :name, :region_name
  has_many :provinces, serializer: ProvinceSerializer
  has_many :districts, serializer: DistrictSerializer

  def code
    object.code
  end

  def name
    object.name
  end

  def region_name
    object.region_name
  end

end
