class SubscriptionsController < ApplicationController
    
    def create
        @subscription = Subscription.new(subscription_params) 
        @subscription.save
        redirect_to channel_path(@subscription.channel_id)
    end
    
    def destroy
        @subscription = Subscription.find(params[:id])
        @subscription.delete
        redirect_to root_url
    end
    
    private
    def subscription_params
        params.require(:subscription).permit(:channel_id, :subscriber_id) 
    end
end
