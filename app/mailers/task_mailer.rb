class TaskMailer < ActionMailer::Base
	def taskCompleted(user)
		mail(to: user.email,
			from:"services@gmail.com",
			subject:"Tasks completed",
			body:"Congrats !"
			)
	end
	def dailyMail(user,nb_users,t_uncompleted,t_completed)
		
				mail(to: user.email,
				from:"services@gmail.com",
				subject:"Task Manager-Daily report",
				#body:"it works !"
				body: "You have: "+ nb_users + " accounts ," + t_uncompleted + " Task uncompleted and "+ t_completed +" tasks completed"
				)
			
		
	end
end