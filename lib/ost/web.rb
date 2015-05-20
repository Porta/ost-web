module Ost
  module Web
    def self.queue_names
      queues = []
      cursor = 0
      begin
        cursor, results = Ost.redis.call("SCAN", cursor, "match", "ost:*")
        queues += results
      end until results.empty?
      queues.map { |queue| queue.sub(/^ost:/, "") }
    end

    def self.queues
      queue_names.map { |name| Ost[name] }
    end
  end
end