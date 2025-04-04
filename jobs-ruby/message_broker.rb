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
# Hash 6318
# Hash 8270
# Hash 2247
# Hash 6329
# Hash 6301
# Hash 7616
# Hash 2382
# Hash 3145
# Hash 9346
# Hash 2818
# Hash 7732
# Hash 8192
# Hash 8087
# Hash 4480
# Hash 3465
# Hash 2186
# Hash 1471
# Hash 1216
# Hash 6659
# Hash 1356
# Hash 5990
# Hash 8939
# Hash 7713
# Hash 6445
# Hash 4703
# Hash 9245
# Hash 5477
# Hash 3447
# Hash 3298
# Hash 1052
# Hash 7194
# Hash 1304
# Hash 5608
# Hash 3896
# Hash 1788
# Hash 7522
# Hash 2763
# Hash 8006
# Hash 4082
# Hash 9273
# Hash 7265
# Hash 4739
# Hash 8067
# Hash 7580
# Hash 1910
# Hash 9402
# Hash 6438
# Hash 4237
# Hash 4524
# Hash 8754
# Hash 6328
# Hash 8016
# Hash 8313
# Hash 2909
# Hash 2048
# Hash 7604
# Hash 7540
# Hash 9015
# Hash 2542
# Hash 1839
# Hash 9867
# Hash 8701