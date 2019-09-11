class ArchiveController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  def show_archive
	  @tasks = if params[:search]
	    if (current_user.admin)
		    Task.
		    where('domain LIKE ?', '%'+ params[:search] +'%').
		    where.not(:completed_at => nil)
		    #@tasks= Task.where(:completed_at => nil)
	    else
		    Task.where('domain LIKE ?', '%'+ params[:search] +'%').
		    where(:user_id => current_user.id).
		    where.not(:completed_at => nil)
	    	#@tasks = Task.where(:user_id => current_user.id, :completed_at => nil)
	    end
	  else
	    if (current_user.admin)
	      @tasks= Task.where.not(:completed_at => nil)
	    else
	      @tasks = Task.where(:user_id => current_user.id).
	      where.not(:completed_at => nil) 
	    end
	  end  
  end

  def new
    @task = Task.new
  end
  def show
  end
end