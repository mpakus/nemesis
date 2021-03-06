class Report::WeekActivity
  def initialize(item)
    @item = item
    @data = []
  end

  def perform
    lists.each do |list_id|
      list = Api::FetchList.new(list_id).perform
      row = {
        name: "Cards in column: #{list.name}",
        list_id: list.id,
      }

      cards = []
      list.cards.each do |card|
        cards << fetch_card(card)
      end

      row[:cards] = cards
      @data << row
    end
    @data
  end

  private

  def fetch_card(card)
    {
      id: card.id,
      name: card.name,
      description: card.desc,
      url: card.url,
      due: card.due,
      closed: card.closed,
      members: fetch_members(card.member_ids)
    }
  end

  def fetch_members(member_ids)
    members = []
    member_ids.each do |id|
      member = Api::FetchMember.new(id).perform
      members << {
        id: member.id,
        username: member.username,
        full_name: member.full_name,
        url: member.url
      }
    end
    members
  end

  # Parse json string with list of columns ids
  # @return [Array]
  def lists
    return [] if @item.lists.blank?
    @lists ||= JSON.parse @item.lists
  end
end

#<Trello::Card:0x007fae611b8e08
# @attributes=
#   {:id=>"5842de6cbf1086eec1ad8655",
#    :short_id=>118,
#    :name=>"Hightlight today's date in datepicker",
#    :desc=>"",
#    :due=>nil,
#    :closed=>false,
#    :url=>
#      "https://trello.com/c/fYexZ1cq/118-hightlight-today-s-date-in-datepicker",
#    :short_url=>"https://trello.com/c/fYexZ1cq",
#    :board_id=>"57fb4ebeddc4ca6d913cc5e4",
#    :member_ids=>["5779fb58b80dc23dc02b5cea"],
#    :list_id=>"57fb4eda5487203418166e05",
#    :pos=>2768896,
#    :last_activity_date=>2016-12-03 15:03:27 UTC,
# :labels=>
#   [#<Trello::Label:0x007fae6119da68
#     @attributes=
#       {:id=>"57fb4ebe84e677fd36c40cc4",
#        :name=>"improve",
#        :board_id=>"57fb4ebeddc4ca6d913cc5e4",
#        :uses=>27,
#        :color=>"yellow"}>,
#     #<Trello::Label:0x007fae6119d540
#     @attributes=
#       {:id=>"57fb4ebe84e677fd36c40cc7",
#        :name=>"front",
#        :board_id=>"57fb4ebeddc4ca6d913cc5e4",
#        :uses=>38,
#        :color=>"purple"}>],
#   :card_labels=>["57fb4ebe84e677fd36c40cc4", "57fb4ebe84e677fd36c40cc7"],
#   :cover_image_id=>nil,
# :badges=>
#   {"votes"=>0,
#    "viewingMemberVoted"=>false,
#    "subscribed"=>false,
#    "fogbugz"=>"",
#    "checkItems"=>0,
#    "checkItemsChecked"=>0,
#    "comments"=>0,
#    "attachments"=>0,
#    "description"=>false,
#    "due"=>nil,
#    "dueComplete"=>false},
#   :card_members=>nil,
# :source_card_id=>nil,
# :source_card_properties=>nil},
