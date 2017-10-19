class SubscriptionsController < ApplicationController
    def create
        @subscription = Subscription.new() 
        @subscription.channel_id = params[:channel_id]
        @subscription.subscriber_id = current_user.id
        @subscription.save
        respond_to do |format|
            format.html { render nothing: true } 
        end
    end
    
    def destroy
        @subscription = Subscription.find(params[:id])
        @subscription.delete
        redirect_to root_path
    end
    
    private
    def subscription_params
        params.require(:subscription).permit(:channel_id, :subscriber_id) 
    end
end
