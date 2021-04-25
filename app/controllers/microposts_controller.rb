class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy,:show]
    before_action :correct_user, only: :destroy

    
        def create
            @micropost = current_user.microposts.build(micropost_params)           

            if !params[:micropost][:tag_ids].nil? && @micropost.save
                # マイクロポストとタグidがないと保存できないように
                
                @micropost.save_tag(params[:micropost][:tag_ids],params[:micropost][:spottag_ids])
                # マイクロポストが保存されたら
                # マイクロポストとタグIDとともにsave_tagしてね
                
                flash.now[:success] = "Micropost created!"
                # 表示されない、、、、
                redirect_to root_url
            else
                @feed_items = []
                flash.now[:danger] = "error!"
                # 表示されない、、、
                logger.debug("testtesttest")
                redirect_to root_url
            end
        end
        
    
        
        
        
        def destroy
            @micropost.destroy
            flash[:success] = "Micropost deleted"
            # 表示されない、、、
            redirect_to request.referrer || root_url
        end
        
        def show
            @micropost = params[:tag_id].present? ? Tag.find(params[:tag_id]).micropost : Micropost.all
        end
        
        
        
    
        
        
        
    private
    
        def micropost_params
          params.require(:micropost).permit(:content, :picture, tag_ids:[], spottag_ids:[])
        end

        
        def correct_user
            @micropost = current_user.microposts.find_by(id: params[:id])
            redirect_to root_url if @micropost.nil?
        end
    
end
