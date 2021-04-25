class TrendController < ApplicationController
    
    def index
        @feed_items = Micropost.all
    end
    
    
    def show
        @microposts = params[:tag_id].present? ? TagMap.find(params[:tag_id]).micropost : Micropost.all
    end
    
end
