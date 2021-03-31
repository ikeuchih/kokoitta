class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
      @user = User.new(params[:user])
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
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end