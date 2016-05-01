# frozen_string_literal: true
class ConnectedList
  REDIS_KEY = 'connected_nodes'

  def self.redis
    @redis ||= ::Redis.new(url: ActionCableConfig[:url])
  end

  def self.all
    redis.smembers(REDIS_KEY)
  end

  def self.clear_all
    redis.del(REDIS_KEY)
  end

  def self.add(uid)
    redis.sadd(REDIS_KEY, uid)
  end

  def self.include?(uid)
    redis.sismember(REDIS_KEY, uid)
  end

  def self.remove(uid)
    redis.srem(REDIS_KEY, uid)
  end
end
