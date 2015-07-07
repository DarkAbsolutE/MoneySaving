module BambooHR
  class Sync
    def self.users
      users = client.employee_list
      users['employees'].each do |data|
        create_user(data)
      end
    end

    def self.create_user(data)
      user_data = {
        name: data['firstName'],
        lastname: data['lastName'],
        position: data['jobTitle']
        }


      if importable?(data)
        user = User.create_with(user_data).find_or_initialize_by(email: data['workEmail'])
        print '.' if  user.save(validate: false)
      end
    end

    def self.client
      unless @client
        @client = Client.new
        @client.key = ENV['BAMBOO_API_KEY']
        @client.subdomain = ENV['BAMBOO_SUBDOMAIN']
      end
      @client
    end

    def self.importable?(data)
      data['workEmail'].present?
    end
  end
end
