module BambooHR
  class Sync
    def self.employees
      employees = client.employee_list
      employees['employees'].each do |data|
        create_employee(data)
      end
    end

    def self.create_employee(data)
      employee_data = {
        name: data['firstName'],
        lastname: data['lastName'],
        status: true,
        email: data['workEmail'],
        photo_url: data['photoUrl']
      }

      if importable?(data)
        print "."
        Employee.where(employee_data).first_or_create
      end
    end

    def self.client
      client = Client.new()
      client.key = ENV['BAMBOO_API_KEY']
      client.subdomain = ENV['BAMBOO_SUBDOMAIN']
      client
    end

    def self.importable?(data)
      data['workEmail'].present?
    end
  end
end
