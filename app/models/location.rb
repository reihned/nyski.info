# require 'geokit'
# require 'geokit-rails'

class Location < ActiveRecord::Base
  # include ActiveModel::Model
  # include ActiveRecord::Validations
  # include ActiveSupport::Concern
  # include Geokit::Mappable

  # attr_accessor :address, :latitude, :longitude

  has_no_table
  column :address,    :varchar
  column :latitude,   :float
  column :longitude,  :float

  acts_as_mappable :default_units =>        :miles,
                   :default_formula =>      :sphere,
                   :distance_field_name =>  :distance,
                   :lat_column_name =>      :latitude,
                   :lng_column_name =>      :longitude
                  #  :auto_geocode =>          {:field=>:address}

  after_initialize :geocode_address, :on => :new

  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode (address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.latitude, self.longitude = geo.lat,geo.lng if geo.success
  end
end
