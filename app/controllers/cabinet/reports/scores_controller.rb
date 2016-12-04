class Cabinet::Reports::ScoresController < Cabinet::ApplicationController
  before_action :set_score, only: [:show]
  def show; end

  private

  def set_score
    @score = Score.where(report: current_account.reports.pluck(:id)).where(code: params[:id]).take!
  end
end
