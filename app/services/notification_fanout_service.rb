class NotificationFanoutService
  def self.fanout(event)
    user_ids = event["audience"] || []
    event_id = event["event_id"]

    user_ids.each do |user_id|
      next if Notification.exists?(user_id: user_id, event_id: event_id)

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
            read: false,
            event_id: event_id
          )
        when "push"
          PushNotifier.send_push(user_id, event)
        end
      end
    end
  end
end
