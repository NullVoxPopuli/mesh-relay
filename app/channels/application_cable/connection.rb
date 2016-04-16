# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uid

    def connect
      self.uid = get_connecting_uid
      logger.add_tags 'ActionCable', uid
    end

    protected

    def get_connecting_uid
      puts request
      request
    end
  end
end
