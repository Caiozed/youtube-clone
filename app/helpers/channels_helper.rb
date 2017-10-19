module ChannelsHelper
    def is_user_subscribed?
        @channel = Channel.find(params[:id])
        @channel.subscribers.any?{|user| user == current_user} 
    end
end
