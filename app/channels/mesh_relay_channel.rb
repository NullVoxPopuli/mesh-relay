# frozen_string_literal: true
# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
#
# A channel is created from a Connection.
# so the uid is delegated to the Connection
class MeshRelayChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from broadcasting_name
    ConnectedList.add(uid)
  end

  def unsubscribed
    ConnectedList.remove(uid)
  end

  # messages received from the clients are handled here. :-)
  def chat(data)
    # uid of the intended recipient
    # only the intended recipient will be able to decrypt
    to = data['to'].to_s

    if ConnectedList.include?(to)
      relay_message(to, data)
    else
      intended_recipient_not_found(to)
    end
  end

  private

  def broadcasting_name(for_uid = uid)
    "mesh_relay_#{for_uid}"
  end

  def intended_recipient_not_found(to)
    ActionCable.server.broadcast(
      broadcasting_name,
      status: 404,
      detail: to,
      error: "Member with UID #{to} could not be found")
  end

  # broadcast the message to the channel
  # that the to client is subscribed to.
  def relay_message(to, data)
    encrypted_message = data['message']

    ActionCable.server.broadcast(
      broadcasting_name(to),
      message: encrypted_message,
      uid: to)
  end
end
