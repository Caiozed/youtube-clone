class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :subscriber_id
      t.integer :channel_id

      t.timestamps null: false
    end
    add_index :subscriptions, [:subscriber_id, :channel_id], unique: true
  end
end
