require 'bamboohr/sync'

namespace :bamboo do
  desc "Synchronize users with bamboo"
  task sync_users: :environment do
    puts "Importing Bamboo users"
    BambooHR::Sync.users
    puts "\nBamboo users sync complete!\n"
  end
end
