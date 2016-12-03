class GenerateReport
  def initialize(report)
    @report = report
    @data = []
  end

  def perform
    @report.items.each do |item|
      @data = "Report::#{item.generator.klass}".constantize.new(report, item).perform
    end
    @data
  end
end
