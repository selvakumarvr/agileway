class TasklistsController < ApplicationController
 before_filter :authenticate
# GET /tasks
  # GET /tasks.json
  def index
  
  @tasklists =  Tasklist.where("user_id = ?", session[:user_id])
  @todo_tasks = Task.where("next_action = ? and user_id = ? ", true,session[:user_id] )
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasklists }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @tasklist = Tasklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tasklists }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @tasklist = Tasklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tasklists }
    end
  end

  # GET /tasks/1/edit
  def edit
  
    @tasklist = Tasklist.find(params[:tasklist_id])
	
  end

  # POST /tasks
  # POST /tasks.json
  def create
  
  @tasklist = current_user.tasklists.new(params[:tasklist]);
 
    respond_to do |format|
      if @tasklist.save
        format.html { redirect_to @tasklist, notice: 'Tasklist was successfully created.' }
        format.json { render json: @tasklist, status: :created, location: @tasklist }
      else
        format.html { render action: "new" }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @tasklist = current_user.tasklists.find(params[:id])

    respond_to do |format|
      if @tasklist.update_attributes(params[:tasklist])
        format.html { redirect_to @tasklist, notice: 'Tasklist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
  
    @tasklist = current_user.tasklists.find(params[:id])
    @tasklist.destroy

    respond_to do |format|
      format.html { redirect_to @tasklist }
      format.json { head :ok }
    end
  end
end

