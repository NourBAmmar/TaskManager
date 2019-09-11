namespace :abc do
	desc "sends scheduled emails"
	task :daily_report => :environment do 

		@users = User.where (:admin == true)
		@t_uncompleted = Task.where(:completed_at => nil).count.to_s
		@t_completed = Task.where.not(:completed_at => nil).count.to_s 
			@users.each do |user|
				
				TaskMailer.dailyMail(user,@users.count.to_s,@t_uncompleted,@t_completed).deliver
			end
	end
end