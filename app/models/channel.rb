class Channel < ActiveRecord::Base
    validates :name, :description, presence: true, length: { minimum: 5 }
    validates :image, presence: true
    belongs_to :user
    mount_uploader :image, ImageUploader
    has_many :videos, dependent: :destroy
    has_many :subscriptions, dependent: :destroy
    has_many :subscribers, through: :subscriptions
end
