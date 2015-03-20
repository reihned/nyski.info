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

    reportFull = self.fullReport
    # puts reportFull

    weather = [ "Today", "Tomorrow", "DayAfterTomorrow", "Day4", "Day5"]

    self.weather = weather.map do |day|
      day = {
        low:        reportFull["weather#{day}_Temperature_Low"],
        high:       reportFull["weather#{day}_Temperature_High"],
        condition:  reportFull["weather#{day}_Condition"]
      } # day
    end
  end

  def fullReport()
    options = {
      query: {
        "apiKey" => ENV["SNOCOUNTRY_API_KEY"],
        "output" => "json"
      }# query
    }# options
    options[:query].merge!({"ids"=>self.report_id})

    response = self.class.get("/conditions.php?",options)
    puts "snow report api hit!"

    # binding.pry
    # puts response
    return JSON.parse(response.body)["items"].first || "error"
  end # location report


end
