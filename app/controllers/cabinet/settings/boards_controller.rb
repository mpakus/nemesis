class Cabinet::Settings::BoardsController < Cabinet::ApplicationController
  def index
    # @boards =
  end

  def create

  end

  def current_client
    # @current_client ||= Trello::Client.new(
    #   :consumer_key => YOUR_CONSUMER_KEY,
    #   :consumer_secret => YOUR_CONSUMER_SECRET,
    #   :oauth_token => "Bob's access token",
    #   :oauth_token_secret => "Bob's access secret"
    # )
  end
end
