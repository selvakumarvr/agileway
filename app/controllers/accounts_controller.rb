class AccountsController < ApplicationController
  def new
     @user = User.new
  end


  def create
    @user = User.new(params[:user])
	
	
	
    if @user.save
	 session[:user_id] = @user.id
     redirect_to tasklists_path, :notice => 'User successfully added.'
    else
      render :action => 'new'
    end
  end
  
    def edit
    @user = current_user
  end
  
  
 def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to tasks_path,
:notice => 'Updated user information successfully.'
    else
      render :action => 'edit'
    end
  end
  def show
  end

end

