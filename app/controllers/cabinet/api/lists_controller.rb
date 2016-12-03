class Cabinet::Api::ListsController < Cabinet::ApplicationController
  def index
    @lists = Rails.cache.fetch("#{current_account.uid}/boards/#{params[:id]}/lists", expires_in: 1.hour) do
      current_client.find(:board, params[:id]).lists
    end
  end
end
