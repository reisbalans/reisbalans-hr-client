require 'oauth2'
require_relative 'employees'
require_relative 'organization_intermediate_settlements'
require_relative 'employee_intermediate_settlements'

module ReisbalansHR
  class Client
    attr_reader :base_url, :client_id, :client_secret

    def initialize(base_url:, client_id:, client_secret:)
      @base_url = base_url
      @client_id = client_id
      @client_secret = client_secret
    end

    def employees
      Employees.new(oauth2_client)
    end

    def organization_intermediate_settlements
      OrganizationIntermediateSettlements.new(oauth2_client)
    end

    def employee_intermediate_settlements
      EmployeeIntermediateSettlements.new(oauth2_client)
    end

    def oauth2_client
      opts = {site: base_url, token_url: '/oauth/token'}
      OAuth2::Client.new(client_id, client_secret, opts)
    end
  end
end
