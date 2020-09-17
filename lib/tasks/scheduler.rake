desc "This task is called by the Heroku scheduler add-on"
task :close_request => :environment do
  puts "Closing requests"
  Request.where('updated_at < ? AND request_state = ?', 8.days.ago, 2).update_all(request_state: 3)
  puts "done."
end