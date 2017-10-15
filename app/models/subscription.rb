class Subscription < ActiveRecord::Base
    belongs_to :subscriber, class_name: :User
    belongs_to :subscribed_channel, class_name: :Channel, foreign_key: "channel_id"
end
