class Channel < ActiveRecord::Base
    validates :name, :description, presence: true, length: { minimum: 5 }
    belongs_to :user
    has_many :videos, dependent: :destroy
    has_many :subscriptions
    has_many :subscribers, through: :subscriptions
end
