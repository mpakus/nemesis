class ReportsEdit
  constructor: ->
    @init_board_list()
    @init_report_list()
    @receiver = $('#report_list')
    @items = $('#report_list_items')

  # -- INIT

  init_board_list: -> $(document).on 'click', '.js_board_list', @on_click_list.bind(@)
  init_report_list: -> $(document).on 'click', '.js_report_list_item', @on_click_report_list.bind(@)

  # -- EVENTS

  on_click_report_list: (e)->
    e.preventDefault()
    @remove_from_list($(e.target).data('id'))
    false

  on_click_list: (e)->
    $this = $(e.target)
    id = $this.data('id')
    name = $this.data('name')
    list = @fetch_list()

    return if id is ""

    if id in list
      @remove_from_list(id)
    else
      @add_to_list(id, name)

  # -- METHODS

  fetch_list: ->
    console.log @receiver.val()
    JSON.parse(@receiver.val()) || []
  save_list: (list)-> @receiver.val(JSON.stringify(list))

  add_to_list: (id, name)->
    list = @fetch_list()
    list.push(id)
    @save_list(list)
    @items.prepend """
      <li id="report_list_item_#{id}">
        #{name} <a href="#" class="js_report_list_item label label-danger pull-right" data-id="#{id}">x</a>
      </li>
    """

  remove_from_list: (id)->
    list = @fetch_list()
    list.slice(list.indexOf(id), 1)
    @save_list(list)
    $("#report_list_item_#{id}").hide('slow').remove()


$(document).on 'turbolinks:load', ->
  return unless $('#reports_edit').length > 0
  reports_edit =  new ReportsEdit
