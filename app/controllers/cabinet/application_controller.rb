# frozen_string_literal: true
class Cabinet::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'cabinet'

  private

  def current_account
    current_user.accounts.last
  end

  def current_client
    @current_client ||= Trello::Client.new(
      consumer_key: ENV['TRELLO_KEY'],
      consumer_secret: ENV['TRELLO_SECRET'],
      oauth_token: current_account.token,
      oauth_token_secret: current_account.secret
    )
  end
end
