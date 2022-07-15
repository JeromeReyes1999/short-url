class CityMunicipalitySerializer < ActiveModel::Serializer
  attributes :name, :code, :is_capital, :is_city, :is_municipality
  has_many :barangays, serializer: BarangaySerializer
  belongs_to :province, serializer: ProvinceSerializer
  belongs_to :district, serializer: DistrictSerializer


  def name
    object.name
  end

  def code
    object.code
  end

  def is_capital
    object.is_capital
  end

  def is_city
    object.is_city
  end

  def is_municipality
    object.is_municipality
  end

end
