class TaskMailer < ActionMailer::Base
	def taskCompleted(user)
		mail(to: user.email,
			from:"services@gmail.com",
			subject:"Tasks completed",
			body:"Congrats !"
			)
	end
end