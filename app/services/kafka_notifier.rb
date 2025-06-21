require "kafka"

class KafkaNotifier
  def self.publish(topic, payload)
    kafka = Kafka.new([ "localhost:9092" ])
    producer = kafka.producer
    producer.produce(payload.to_json, topic: topic)
    producer.deliver_messages
  end
end
