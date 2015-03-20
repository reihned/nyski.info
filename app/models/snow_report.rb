class SnowReport < ActiveRecord::Base
  include HTTParty
  base_uri 'http://feeds.snocountry.net'

  #instanced model
  has_no_table
  column :report_id,  :integer

  attr_accessor :weather

  # base uri for httparty
  base_uri 'http://feeds.snocountry.net'

  after_initialize do
    puts "after initialize"
    @options = { query: {
        "apiKey" => ENV["SNOCOUNTRY_API_KEY"],
        "output" => "json"
      }# query
    }# options

    fullReport = self.fullReport

    self.weather = [
      {
        low: fullReport["weatherToday_Temperature_Low"],
        high: fullReport["weatherToday_Temperature_High"]
      },
      {
        low: fullReport["weatherTomorrow_Temperature_Low"],
        high: fullReport["weatherTomorrow_Temperature_High"]
      },
      {
        low: fullReport["weatherDayAfterTomorrow_Temperature_Low"],
        high: fullReport["weatherDayAfterTomorrow_Temperature_High"]
      },
      {
        low: fullReport["weatherDay4_Temperature_Low"],
        high: fullReport["weatherDay4_Temperature_High"]
      },
      {
        low: fullReport["weatherDay5_Temperature_Low"],
        high: fullReport["weatherDay5_Temperature_High"]
      },
    ]
  end

  def fullReport(location_id=self.report_id)
    options = @options
    options[:query].merge!({"ids"=>location_id})

    response = self.class.get("/conditions.php?",options)

    return response["items"].first || "error"
  end # location report


end
