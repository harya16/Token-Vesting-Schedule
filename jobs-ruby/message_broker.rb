module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 2134
# Hash 6058
# Hash 3994
# Hash 3724
# Hash 1554
# Hash 4811
# Hash 6913
# Hash 7068
# Hash 1971
# Hash 5434
# Hash 1324
# Hash 4305
# Hash 2005
# Hash 6884
# Hash 7756
# Hash 3772
# Hash 1222
# Hash 3951