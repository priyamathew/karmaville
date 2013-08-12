desc "Update total karma points"
task :karma_sum => :environment do
  User.find_each do |user|
    user.update_attribute(:total_karma_points, user.total_karma)
  end
end
