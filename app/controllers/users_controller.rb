class UsersController < ApplicationController

  def new
    @user = User.new(params[:user])
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    # .paginate(page: params[:page])
    # redirect_to root_url and return unless @user.activated?   
  end

  
  # def create
  #     @user = User.new(params[:user])
  #       if @user.save
  #         flash[:success] = "新規登録完了！kokoitta!楽しんでね♡"
  #         redirect_to @user
  #       else
  #         render 'new'
  #       end
  # end
  
  private
  
    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
end