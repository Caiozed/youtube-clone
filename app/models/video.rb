class Video < ActiveRecord::Base
    scope :recent, -> { order(updated_at: :asc) }
    validates :name, :description, :thumbnail, presence: true  
    belongs_to :channel
    has_many :comments, dependent: :destroy
    mount_uploader :thumbnail, ImageUploader
    mount_uploader :video_file, VideoUploader
end
