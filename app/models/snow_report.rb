class SnowReport < ActiveRecord::Base
  include HTTParty
  base_uri 'http://feeds.snocountry.net'

  # THIS CAN BE REFACTORED TO SAVE AND UPDATE DAILY INSTEAD OF INSTANCED

  # instanced model
  has_no_table
  column :report_id,    :integer
  # column :resort_name,  :varchar

  attr_accessor :resort_name,
                :weather,
                :snow,
                :trails,
                :lifts

  # base uri for httparty
  base_uri 'http://feeds.snocountry.net'

  after_initialize do
    # puts "after initialize"

    reportFull = self.fullReport
    # puts reportFull

    # set resort name
    self.resort_name = fullReport["resortName"]

    # set weather
    weather = [ "Today", "Tomorrow", "DayAfterTomorrow", "Day4", "Day5"]
    self.weather = weather.map do |day|
      day = {
        day:        day.gsub(/(?<x>([A-Z]|\d))/, ' \k<x>').lstrip,
        low:        reportFull["weather#{day}_Temperature_Low"],
        high:       reportFull["weather#{day}_Temperature_High"],
        condition:  reportFull["weather#{day}_Condition"]
      } # day
    end

    # set surface
    surfaces = [ "primary", "secondary" ]
    self.snow = surfaces.map do |surface|
      surface = { surface => reportFull["#{surface}SurfaceCondition"] }
    end

    # set trails
    self.trails = [
      reportFull["openDownHillTrails"],
      reportFull["maxOpenDownHillTrails"]
    ].join("/")

    # set lifts
    self.lifts = [
      reportFull["openDownHillLifts"],
      reportFull["maxOpenDownHillLifts"]
    ].join("/")
  end

# private

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
