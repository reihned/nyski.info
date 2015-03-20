class SkiLocation < ActiveRecord::Base
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude,
                   :auto_geocode=>{:field=>:address}

  has_many :trips

  attr_accessor :report

  after_initialize do
    self.report = self.generateReport
    # puts self.report
  end

  # private
  def generateReport(this=self)
    report = SnowReport.new({report_id: this.attributes["report_id"]})
    # puts this.attributes
    return report
  end
end
