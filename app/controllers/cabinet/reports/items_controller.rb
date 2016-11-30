class Cabinet::Reports::ItemsController < Cabinet::ApplicationController
  def create
    @report = current_account.reports.find(params[:report_id])
    @report.items.create(item_params)

    redirect_to edit_cabinet_report_path(@report)
  end

  private

  def item_params
    params.require(:item).permit(:generator_id)
  end
end
