### THIS CODE IS REDUNDANT NOW THAT WE USE GEOKIT ###
### THIS WILL BE REMOVED IN A FUTURE ITERATION ###
### DO NOT INCLUDE ###

module GeocodeApi
  # https://developers.google.com/maps/documentation/geocoding/
  extend ActiveSupport::Concern

  class GeocodeApi
    include HTTParty
    base_uri 'https://maps.googleapis.com'

    def initialize()
      @options = { query: {"key" => ENV["GEOCODE_API_KEY"]} }
      # Ensure your bashprofile has an environmental variable called GEOCODE_API_KEY
    end

    def addressToGeo(address)
      # assuming address is a string

      # regular expression to sanitize address here
      address_sanitized = address.gsub(/\W+/, "+")

      # set up the query
      query = @options
      query[:query].merge!({"address" => address_sanitized})

      # get call to get geocode
      response = self.class.get("/maps/api/geocode/json?", query)

      # return geocode as a hash
      return response["results"][0]["geometry"]["location"]
      # SAMPLE: {"lat"=>40.7393083, "lng"=>-73.9894285}
    end

  end



end
