class Cabinet::ReportsController < Cabinet::ApplicationController
  before_action :set_report, only: [:edit]
  def index
   @reports = current_account.reports
  end

  def create
    @report = current_account.reports.create
    redirect_to edit_cabinet_report_path(@report)
  end

  def edit
    @item = Item.new
    @boards = current_client.find(:members, current_account.uid).boards
  end

  private

  def set_report
    @report = current_account.reports.find(params[:id])
  end
end
