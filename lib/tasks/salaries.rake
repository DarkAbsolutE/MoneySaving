require 'initialize/initialize_salaries'

namespace :salaries do
  desc "Initialize salaries"
  task initialize_salaries: :environment do
    puts "Initialize salaries"
    Initialize::Initialize_salaries.salaries
    puts "\nSalaries initialize complete!\n"
  end
end
