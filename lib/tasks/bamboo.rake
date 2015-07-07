require 'bamboohr/sync'

namespace :bamboo do
  desc "Synchronize employees with bamboo"
  task sync_users: :environment do
    puts "Importing Bamboo employees"
    BambooHR::Sync.employees
    puts "\nBamboo users sync complete!\n"
  end
end
