class Api::FetchMember < Api::Client
  def initialize(member_id)
    @member_id = member_id
  end

  def perform
    # Rails.cache.fetch("#{account_uid}/lists/#{@list_id}/cards") do
    client.find(:member, @member_id)
  end
end
