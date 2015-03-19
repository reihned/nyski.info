class SnowReport < ActiveRecord::Base
  include HTTParty

  belongs_to :ski_location
  has_no_table

  # base uri for httparty
  base_uri 'http://feeds.snocountry.net'

  # So, assuming lazy loading...

end
