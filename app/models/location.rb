class Location < ActiveRecord::Base
  validates_presence_of :name, :area

  def coordinates
    RGeo::GeoJSON.encode(area)['coordinates']
  end
end
