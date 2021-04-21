class TrendController < ApplicationController
    def index
        if user_signed_in?
            @micropost = current_user.microposts.build 
            @feed_items = current_user.feed
        end
    end
    
    def show
        @microposts = params[:tag_id].present? ? TagMap.find(params[:tag_id]).micropost : Micropost.all
    end
    
end
