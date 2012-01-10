class TasksController < ApplicationController

  before_filter :load_tasklist, :except => [:destroy, :complete,:nextaction]
  before_filter :authenticate
  # GET /tasks
  # GET /tasks.json
  def index
  
  @tasks =  Task.where("user_id = ?", session[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
	
  end

  
  
  # POST /tasks
  # POST /tasks.json
  def create
  
  
   @task = @tasklist.tasks.create(params[:task]);
    
	@task.user_id = session[:user_id];
	
 @task.status='A';
      if @task.save
		 respond_to do |format|
        #format.html { redirect_to @tasklist, notice: 'Task was successfully created.' }
		format.js
		 end
      else
	   respond_to do |format|
        format.html { render action: "new" }
        format.js 
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @tasklist, notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
  
    @tasklist = current_user.tasklists.find(params[:tasklist_id])
    @task = @tasklist.tasks.find(params[:id])
    
    @task.destroy

    respond_to do |format|
	format.html { redirect_to @tasklist, notice: 'Task was successfully deleted.' }
      
      format.json { head :ok }
    end
  end
  
  
  
  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def complete 
   
	@tasklist = current_user.tasklists.find(params[:tasklist_id])
    @task = @tasklist.tasks.find(params[:id])
    
    @task.status="C"
	 
    if @task.update_attributes(params[:task])
		 respond_to do |format|     
		format.html
			 format.js
		end
      else
       format.html { redirect_to tasklist_url }
        format.js
      end
  end
  
  
    # DELETE /tasks/1
  # DELETE /tasks/1.json
  def uncomplete 
   
	@tasklist = current_user.tasklists.find(params[:tasklist_id])
    @task = @tasklist.completed_task.find(params[:id])
    
    @task.status="A"
	 
    if @task.update_attributes(params[:task])
		 respond_to do |format|     
		format.html
			 format.js
		end
      else
       format.html { redirect_to tasklist_url }
        format.js
      end
  end
  
  
      # DELETE /tasks/1
  # DELETE /tasks/1.json
  def nextaction 
   

    @task = Task.find(params[:id])
	 
      @task.next_action=  !@task.next_action

	@task.save
  
		render :nothing => true	
	   
	 
  end
  
  
  
  private
    def load_tasklist
      @tasklist = Tasklist.find(params[:tasklist_id])
    end
end

