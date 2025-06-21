class PushNotifier
  def self.send_push(user_id, event)
    Rails.logger.info("📱 Push sent to User ##{user_id} | #{event["content"]}")
  end
end
