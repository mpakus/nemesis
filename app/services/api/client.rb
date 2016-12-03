class Api::Client
  @@client = nil
  @@account = nil

  def self.config(account)
    @@client = nil # reset client
    @@account = account
  end

  def self.client
    @@client ||= Trello::Client.new(
      consumer_key: ENV['TRELLO_KEY'],
      consumer_secret: ENV['TRELLO_SECRET'],
      oauth_token: @@account.token,
      oauth_token_secret: @@account.secret
    )
  end

  def client
    Api::Client.client
  end

  def account_uid
    @@account.uid
  end
end
