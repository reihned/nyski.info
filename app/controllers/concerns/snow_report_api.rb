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

  end # class
end # module
