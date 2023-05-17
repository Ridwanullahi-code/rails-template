require 'rufus-scheduler'

# Create a new scheduler instance
scheduler = Rufus::Scheduler.new

# Schedule the task to run
scheduler.every '4s' do
  system('bundle exec rake users:update_balances')
	# puts 'Hello world'
end

#Schedule the task to run once every day  at 12:00am
# scheduler.every '4s' do
# 	system('rake users:increment')
# end