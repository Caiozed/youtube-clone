class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to channel_video_path(@comment.video.channel, @comment.video)
    end
    
    private
    
    def comment_params
       params.require(:comment).permit(:content, :video_id) 
    end
end
