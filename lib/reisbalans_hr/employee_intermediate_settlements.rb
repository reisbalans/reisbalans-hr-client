require_relative 'resources'

module ReisbalansHR
  class EmployeeIntermediateSettlements < Resources
    def initialize(oauth2_client)
      super(oauth2_client, '/employee_intermediate_settlements')
    end
  end
end
