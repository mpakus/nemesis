class Cabinet::ReportsController < Cabinet::ApplicationController
  before_action :set_report, only: [:edit, :update]
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

  def update
    @report.update(report_params)
    redirect_to edit_cabinet_report_path(@report)
  end

  private

  def report_params
    params.require(:report).permit(:name, items_attributes: [:id, :lists, :generator_id])
  end

  def set_report
    @report = current_account.reports.find(params[:id])
  end
end
