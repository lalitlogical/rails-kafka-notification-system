class UserPreference < ApplicationRecord
  def self.channels_for(user_id)
    find_by(user_id: user_id)&.preferences&.fetch("channels", []) || []
  end
end
