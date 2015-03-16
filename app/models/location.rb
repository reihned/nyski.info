class SkiLocation
  include ActiveModel::Model
  

  attr_accessor :address, :latitude, :longitude

  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude,
                   :auto_geocode=>{:field=>:address}
end
