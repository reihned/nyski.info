# http://feeds.snocountry.net/conditions.php?apiKey=xxx&ids=xxx

module SnowReportApi
  extend ActiveSupport::Concern

  class SnowReportApi
    include HTTParty
    base_uri 'http://feeds.snocountry.net'

    def initialize()
      @options = { query: {
          "apiKey" => ENV["SNOCOUNTRY_API_KEY"],
          "output" => "json"
        }# query
      }# options
    end # initialize

    def locationReport(location_id)
      options = @options
      options[:query].merge!({"ids"=>location_id})

      response = self.class.get("/conditions.php?",options)

      return response["items"].first || "error"
    end # location report

    #temperature should be in fahrenheit

  end # class
end # module
