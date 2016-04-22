class ConnectedList
  REDIS_KEY = 'connected_nodes'

  def self.add(uid)
    Redis.sadd(REDIS_KEY, uid)
  end

  def self.include?(uid)
    Redis.sismember(REDIS_KEY, uid)
  end

  def self.remove(uid)
    Redis.srem(REDIS_KEY, uid)
  end

end
