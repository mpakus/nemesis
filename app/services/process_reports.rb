class ProcessReports
  def initialize
    @reports = []
  end

  def perform
    Report.includes(:items).find_each do |report|
       @reports << GenerateReport.new(report).perform
    end
    @reports
  end
end
