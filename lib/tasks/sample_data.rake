namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do
		users = User.all(limit: 6)
		50.times do
			eta = Time.now + (7*24*60*60)
			users.each { |user| user.orders.create!(eta: eta) }
		end
	end
end
