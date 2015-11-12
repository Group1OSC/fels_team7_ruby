class Admin::UsersController < ApplicationController
  # Methods omitted
  layout "admin"
  #index action
  def index
  	@users = User.all
  end
  #show action
  def show
    # byebug
  	@user = User.find(params[:id])
  end
  #edit action
  def edit
  	@user = User.find(params[:id])   
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Updated"
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end
  #destroy action
  def destroy
    User.find(params[:id]).destroy
      #if current_user?(@user)
        #redirect_to users_path, notice: "You can't destroy yourself!"
      #else
        #flash[:success] = "Destroyed!"
        #redirect_to admin_users_path
      #end
      flash[:success] = "Destroyed"
      redirect_to admin_users_path    
  end
  
  #new
  def new
  	@user = User.new
  end
  #Create
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User Created"
      redirect_to admin_users_path
    else
      render 'new'
    end
  end

  #private
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end