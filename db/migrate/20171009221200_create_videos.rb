class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.string :thumbnail
      t.string :video_file
      t.string :channel_id

      t.timestamps null: false
    end
  end
end
