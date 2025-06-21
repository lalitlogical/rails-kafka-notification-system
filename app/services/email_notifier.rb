class EmailNotifier
  def self.send_email(user_id, event)
    Rails.logger.info("📩 Email sent to User ##{user_id} | #{event["content"]}")
  end
end
