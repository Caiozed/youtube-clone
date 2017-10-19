class ChannelsController < ApplicationController
    before_action :is_signed_in?
    def index
        @user = User.find(current_user.id) 
    end
    
    def show
       @channel = Channel.find(params[:id]) 
        if user_signed_in? 
           @subscription = Subscription.find_by(subscriber_id: current_user.id, channel_id: @channel.id)
        end
    end
    
    def new
        @channel = current_user.channels.build()
    end
    
    def edit
        @channel = Channel.find(params[:id])
    end
    
    def create
        @channel = current_user.channels.build(channel_params)
        if @channel.save
            flash[:success] = "Channel created!"
            redirect_to channels_path
        else
            render :new
        end
    end
    
    def update
        @channel = Channel.find(params[:id])
        if @channel.update(channel_params)
            flash[:success] = "Channel updated!"
            redirect_to channels_path
        else
            render :edit
        end
    end
    
    def destroy
        @channel = Channel.find(params[:id])
        if @channel.destroy
            flash[:success] = "Channel deleted!"
            redirect_to channels_path
        else
            redirect_to channels_path
        end
    end   
    
    private
    def channel_params
       params.require(:channel).permit(:name, :description, :image)
    end
    
    def is_signed_in?
        unless user_signed_in?
            flash[:danger] = "Please Sign in!"
            redirect_to new_user_session_path  
        end
    end
end
