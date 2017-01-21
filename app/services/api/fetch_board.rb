class Api::FetchBoard < Api::Client
  def initialize(board_id)
    @board_id = board_id
  end

  def perform
    # Rails.cache.fetch("#{account_uid}/lists/#{@list_id}/cards") do
    client.find(:board, @board_id)
  end
end
