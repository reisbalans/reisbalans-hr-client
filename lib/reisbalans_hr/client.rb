require 'oauth2'
require_relative 'employees'

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

    # def salary_employment
    #   SalaryEmployment.new(oauth2_client)
    # end

    # def salary_component
    #   SalaryComponent.new(oauth2_client)
    # end

    # def company_salary_component
    #   CompanySalaryComponent.new(oauth2_client)
    # end

    def oauth2_client
      opts = {site: base_url, token_url: '/oauth/token'}
      OAuth2::Client.new(client_id, client_secret, opts)
    end
  end
end
