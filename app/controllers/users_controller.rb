class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html {
          log_in @user
          flash[:success] = "Welcome to the Sample App!"
          redirect_to @user
        }
        format.json { render json: {status: :success} }
      else
        format.html { render 'new' }
        format.json { render json: {message: @user.errors, status: :error} }
      end
    end
    
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end