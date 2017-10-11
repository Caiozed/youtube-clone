class ChannelsController < ApplicationController
    
    def index
        @user = User.find(current_user.id)    
    end
    
    def show
       @channel = Channel.find(params[:id]) 
    end
    
    def new
        @channel = current_user.channels.build()
    end
    
    def edit
        @channel = Channel.find(params[:id])
    end
    
    def create
        channel = current_user.channels.build(channel_params)
        if channel.save
            redirect_to channels_path
        else
            render :new
        end
    end
    
    def update
        @channel = Channel.find(params[:id])
        if @channel.update(channel_params)
            redirect_to channels_path
        else
            render :edit
        end
    end
    
    def destroy
        @channel = Channel.find(params[:id])
        if @channel.destroy
            redirect_to channels_path
        else
            redirect_to channels_path
        end
    end    
    def channel_params
       params.require(:channel).permit(:name, :description)
    end
end
