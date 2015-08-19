require 'initialize/initialize_saving_companies'

namespace :saving_companies do
  desc "Initialize saving companies"
  task initialize_saving_campanies: :environment do
    puts "Initialize saving companies"
    Initialize::Initialize_saving_companies.saving_companies
    puts "\nSaving campanies initialize complete!\n"
  end
end
