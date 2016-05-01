# frozen_string_literal: true
# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uid

    def connect
      self.uid = get_connecting_uid
      logger.add_tags 'ActionCable', uid
    end

    protected

    # NOTE: in order to reject a connection, call
    #       reject_unauthorized_connection

    # the connection URL to this actioncable/channel must be
    # domain.tld?uid=the_uid
    def get_connecting_uid
      request.params[:uid]
    end
  end
end
