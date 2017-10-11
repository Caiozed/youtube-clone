class VideosController < ApplicationController
    
    def index
        @channel = Channel.find(params[:channel_id])
    end
    
    def new
        @channel = Channel.find(params[:channel_id])
        @video = Video.new() 
    end
    
    def show
        @video = Video.find(params[:id])
    end
    
    def edit
        @video = Video.find(params[:id])
    end
    
    def create 
        @video = video_build
        if @video.save
            redirect_to channel_videos_path(params[:channel_id])
        else
            render :new
        end
    end
    
    def update
        @video = Video.find(params[:id])
        if @video.update(video_params)
            redirect_to channel_videos_path(params[:channel_id])
         else
            render :edit
        end
    end
    
    def destroy
        video = Video.find(params[:id])
        if video.destroy
            redirect_to channel_videos_path(params[:channel_id])
        end
    end
    
    def video_params
        params.require(:video).permit(:name, :description, :thumbnail, :video_file)
    end
    
    def video_build
        Channel.find(params[:channel_id]).videos.build(video_params)
    end
end
