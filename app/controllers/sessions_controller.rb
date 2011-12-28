class SessionsController < ApplicationController
  def new
  end

  
  def register
  end

  
  def create
  
   @current_user = User.find_by_login_and_password(
      params[:login], params[:password])

    if @current_user
      session[:user_id] = @current_user.id
      redirect_to tasklists_path
    else
      render :action => 'new'
    end
	
  end

  def destroy
    reset_session
    redirect_to login_path, :notice => t('sessions.logout_success')
  end

  def show
  end
end


