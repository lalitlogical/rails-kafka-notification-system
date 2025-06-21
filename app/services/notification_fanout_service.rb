class NotificationFanoutService
  # CHANNELS = %w[email in_app push]

  def self.fanout(event)
    user_id = event["user_id"]
    preferred_channels = UserPreference.channels_for(user_id)

    preferred_channels.each do |channel|
      case channel
      when "email"
        EmailNotifier.send_email(user_id, event)
      when "in_app"
        Notification.create!(
          user_id: user_id,
          channel: channel,
          message: event["content"],
          read: false
        )
      when "push"
        PushNotifier.send_push(user_id, event)
      end
    end
  end
end
