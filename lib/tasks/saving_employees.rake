require 'initialize/initialize_saving_employees'

namespace :saving_employees do
  desc "Initialize saving employees"
  task initialize_saving_employees: :environment do
    puts "Initialize saving employees"
    Initialize::Initialize_saving_employees.saving_employees
    puts "\nSaving employees initialize complete!\n"
  end
end
