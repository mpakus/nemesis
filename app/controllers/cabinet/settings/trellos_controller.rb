require 'trello'

class Cabinet::Settings::TrellosController < Cabinet::ApplicationController
  def index
    HttpLogger.colorize = true # Default: true
    HttpLogger.log_headers =true  # Default: false
    HttpLogger.log_request_body  = true  # Default: true
    HttpLogger.log_response_body = true  # Default: true
    HttpLogger.level = :debug # Desired log level as a symbol. Default: :debug

    # Trello.open_public_key_url
    #
    # puts '-------->>>>>>>>>'
    # puts ENV['TRELLO_KEY']

    # Trello.configure do |config|
    #   config.consumer_key    = ENV['TRELLO_KEY'],
    #   config.consumer_secret = ENV['TRELLO_SECRET'],
    #   config.return_url      = callback_cabinet_settings_trellos_url
    #   config.callback        = lambda { |request_token| puts '-----'; puts request_token.key; puts request_token.secret; }
    # end
    #
    # mpak = Trello::Member.find('MpaK')
    # pp mpak

    redirect_to "https://trello.com/1/authorize?key=#{ENV['TRELLO_KEY']}&response_type=token&name=NemesisApp&oauth_callback=#{callback_cabinet_settings_trellos_url}&expiration=never"

    # @TODO: check how oauth1 works with trello, because now I always get error 500
    # consumer = OAuth::Consumer.new(
    #   ENV['TRELLO_KEY'],
    #   ENV['TRELLO_SECRET'],
    #   {
    #     site: "https://trello.com",
    #     http_method: 'get',
    #     request_token_path: '/1/OAuthGetRequestToken',
    #     authorize_path: '/1/OAuthAuthorizeToken',
    #     access_token_path: '/1/OAuthGetAccessToken',
    #     query_string: 'name=NemesisApp'
    #   }
    #   # site: 'https://trello.com',
    #   # # scheme: :header,
    #   # http_method: :get,
    #   # request_token_url: '1/OAuthGetRequestToken',
    #   # access_token_url: '/1/OAuthGetAccessToken',
    #   # authorize_url: '/1/OAuthAuthorizeToken'
    # )
    # request_token = consumer.get_request_token(oauth_callback: callback_cabinet_trellos_url)
    # session[:request_token] = request_token
    # redirect request_token.authorize_url(oauth_callback: 'http://10041950.ngrok.io/cabinet/trellos/callback', name: 'name=NemesisApp', scope: 'read,write,create')
  end

  def callback
    # request_token = session[:request_token]
    # access_token  = request_token.get_access_token(oauth_verifier: params[:oauth_verifier])
  end

  def finishit
    current_user.accounts.create(token: params[:token])
    redirect_to cabinet_settings_boards_path, notice: 'Trello Connected'
  end
end
