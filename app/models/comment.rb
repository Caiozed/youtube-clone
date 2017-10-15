class Comment < ActiveRecord::Base
    validates :content, presence: true
    belongs_to :video
    belongs_to :user
end
