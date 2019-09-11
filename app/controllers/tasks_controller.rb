class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = if params[:search]
      if (current_user.admin)
        Task.
        where('domain LIKE ?', '%'+ params[:search] +'%').
        where(:completed_at => nil)
        #@tasks= Task.where(:completed_at => nil)
      else
        Task.where('domain LIKE ?', '%'+ params[:search] +'%').
        where(:user_id => current_user.id, :completed_at => nil)
        #@tasks = Task.where(:user_id => current_user.id, :completed_at => nil)
      end
    else
      if (current_user.admin)
        @tasks= Task.where(:completed_at => nil)
      else
        @tasks = Task.where(:user_id => current_user.id, :completed_at => nil) 
      end
    end
end
  

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end
  #Task completed
  def complete
    @task = Task.find(params[:id])
    @task.update_attribute(:completed_at, Time.now)
    if(Task.where(:domain => @task.domain).
    where(:user_id => current_user.id, :completed_at => nil).count==0)
    TaskMailer.taskCompleted(current_user).deliver
    end
    redirect_to tasks_path
  
  end
  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.done=false
    @task.user=current_user

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :body, :domain, :done, :term)
    end
end
