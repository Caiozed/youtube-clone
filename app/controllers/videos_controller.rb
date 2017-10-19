class VideosController < ApplicationController
    before_action :is_signed_in?
    def new
        @channel = Channel.find(params[:channel_id])
        @video = Video.new() 
    end
    
    def show
        @video = Video.find(params[:id])
        @comments = @video.comments
        @comment = Comment.new()
        if user_signed_in? 
           @subscription = Subscription.find_by(subscriber_id: current_user.id, channel_id: @video.channel.id)
        end
    end
    
    def edit
        @video = Video.find(params[:id])
    end
    
    def create 
        @video = video_build
        if @video.save
            flash[:success] = "Video created!"
            redirect_to channels_path
        else
            render :new
        end
    end
    
    def update
        @video = Video.find(params[:id])
        if @video.update(video_params)
            flash[:success] = "Video updated!"
            redirect_to channel_video_path(params[:channel_id], @video.id)
         else
            render :edit
        end
    end
    
    def destroy
        @video = Video.find(params[:id])
        if @video.destroy
            flash[:success] = "Video deleted!"
            redirect_to channel_path(params[:channel_id])
        end
    end
    
    private
    def video_params
        params.require(:video).permit(:name, :description, :thumbnail, :video_file)
    end
    
    def video_build
        Channel.find(params[:channel_id]).videos.build(video_params)
    end

    def is_signed_in?
        unless user_signed_in?
            flash[:danger] = "Please Sign in!"
            redirect_to new_user_session_path  
        end
    end
end
