module VideosHelper
    
    def is_user_subscribed?
       @video.channel.subscribers.any?{|user| user == current_user} 
    end
end
