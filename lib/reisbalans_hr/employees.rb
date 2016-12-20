require_relative 'resources'

module ReisbalansHR
  class Employees < Resources
    def initialize(oauth2_client)
      super(oauth2_client, '/employees')
    end
  end
end
