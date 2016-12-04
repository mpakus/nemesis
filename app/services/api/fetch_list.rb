class Api::FetchList < Api::Client
  def initialize(list_id)
    @list_id = list_id
  end

  def perform
    # Rails.cache.fetch("#{account_uid}/lists/#{@list_id}/cards") do
    client.find(:list, @list_id)
  end
end
