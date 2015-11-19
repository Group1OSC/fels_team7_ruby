class SessionsController < ApplicationController

  def new
  end

  def create
    #user = User.find_by(email: params[:session][:email].downcase)
    #if user && user.authenticate(params[:session][:password])
      #log_in user
      #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      #redirect_to user
    #else
      #flash.now[:danger] = 'Invalid email/password combination'
      #render 'new'
    #end
    user = User.find_by(email: params[:session][:email].downcase)
    $stdout.puts params
    respond_to do |format|
      
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        format.html{
          redirect_to user
        }
        format.json {render json: {user: user, status: :success}} 
      else
        format.html{
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        }
        format.json {render json: {message: "Not found user", status: :error }}
      end

    end

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end