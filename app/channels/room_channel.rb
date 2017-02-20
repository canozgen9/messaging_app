class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
    ActionCable.server.broadcast 'room_channel', '<div class="alert alert-info"><b>'+current_user.email+'</b> connected.</div>'
  end

  def unsubscribed
    ActionCable.server.broadcast 'room_channel', '<div class="alert alert-danger"><b>'+current_user.email+'</b> disconnected.</div>'
  end

  def speak(data)
    #ActionCable.server.broadcast 'room_channel', data['message']
    Message.create content: data['message'], user: current_user
  end
end
