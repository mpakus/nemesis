class Cabinet::Api::ListsController < Cabinet::ApplicationController
  # before_action :reconfig

  def index
    @board = current_client.find(:board, params[:id])
    # @board = Trello::Board.find(params[:id])
  end

  # def reconfig
  #   Trello.configure do |config|
  #     config.consumer_key = ENV['TRELLO_KEY']
  #     config.consumer_secret = ENV['TRELLO_SECRET']
  #     config.oauth_token = current_account.token
  #     config.oauth_token_secret = current_account.secret
  #   end
  # end
end
