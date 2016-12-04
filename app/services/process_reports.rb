class ProcessReports
  def initialize
    @reports = []
  end

  # Generate all Reports and save their results into the Score table
  # @return [Array] ids of Scores
  def perform
    Report.includes(:items).find_each do |report|
       score = report.scores.create(content: GenerateReport.new(report).perform)
       @reports << score.code
    end
    @reports
  end
end
