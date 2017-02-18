App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    #alert "connected"

  disconnected: ->
    # alert "disconnected"
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # alert "\"#{data}\" received"
    # Called when there's incoming data on the websocket for this channel
    $messages = $('#messages')
    $messages.append data
    $messages.scrollTop $messages.prop('scrollHeight')
    $("html, body").animate({ scrollTop: $(document).height() - $(window).height() },200);

  speak: (message) ->
    # alert "#{message} speak function"
    @perform 'speak', message: message
