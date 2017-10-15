class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :channels, dependent: :destroy
  has_many :comments 
  has_many :subscriptions, foreign_key: "subscriber_id"
  has_many :subscribed_channels, through: :subscriptions
end
