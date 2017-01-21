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
    @item = Item.find(params[:item_id]) if params[:item_id]
    @boards = Rails.cache.fetch("#{current_account.uid}/boards", expires_in: 1.hour) do
      current_client.find(:members, current_account.uid).boards
    end
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
