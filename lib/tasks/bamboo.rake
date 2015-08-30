require 'bamboohr/sync'

namespace :bamboo do
  desc "Synchronize employees with bamboo"
  task sync_employees: :environment do
    puts "Importing Bamboo employees"
    BambooHR::Sync.employees
    puts "\nBamboo users sync complete!\n"
  end
end
