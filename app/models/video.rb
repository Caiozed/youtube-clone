class Video < ActiveRecord::Base
    validates :name, :description, :thumbnail, presence: true  
    belongs_to :channel
    mount_uploader :thumbnail, ImageUploader
    mount_uploader :video_file, VideoUploader
end
