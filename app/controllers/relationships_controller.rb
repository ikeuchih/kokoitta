class RelationshipsController < ApplicationController
    before_action :set_user
    
    def create
        following = current_user.follow(@user)
        if following.save
            flash[:success] = 'フォローしました'
            redirect_to @user
        else
            flash.now[:alert] = 'フォローできません'
            redirect_to @user
        end
    end
    
    def destroy
        following = current_user.unfollow(@user)
        if following.destroy
            flash[:success] = 'フォロ解除しました'
            redirect_to @user
        else
            flash.now[:alert] = 'フォロー解除できません'
            redirect_to @user
        end
    end
    
    private
    
    def set_user
        @user = User.find(params[:follow_id])
    end
    
end



