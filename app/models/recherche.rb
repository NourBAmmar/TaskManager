class Recherche < ApplicationRecord


	def search_tasks

		if (current_user.admin)
	    tasks = tasks.where(:completed_at => nil)
	    #@tasks= Task.where(:completed_at => nil)
	    else
	    tasks = tasks.where(:user_id => current_user.id, :completed_at => nil)
	    #@tasks = Task.where(:user_id => current_user.id, :completed_at => nil)
	    end
	    tasks = tasks.where(["title LIKE ?", "%#{keywords}%"]) if keywords.present?
	    tasks = tasks.where(["domain LIKE ?",  category]) if category.present?

	  	return tasks
  end
end
