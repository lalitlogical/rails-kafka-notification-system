class CreateUserPreferences < ActiveRecord::Migration[8.0]
  def change
    create_table :user_preferences do |t|
      t.integer :user_id
      t.jsonb :preferences, default: {}, null: false

      t.timestamps
    end

    add_index :user_preferences, :user_id, unique: true
  end
end
