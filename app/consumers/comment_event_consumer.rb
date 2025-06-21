class CommentEventConsumer < Racecar::Consumer
  subscribes_to "comment_events"

  def process(message)
    payload = JSON.parse(message.value)
    puts "🎯 Received comment event for ticket #{payload["ticket_id"]}"
     # puts "payload: #{payload}"
     # puts "-" * 100

     NotificationFanoutService.fanout(payload)
  end
end
