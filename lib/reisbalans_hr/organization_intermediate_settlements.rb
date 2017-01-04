require_relative 'resources'

module ReisbalansHR
  class OrganizationIntermediateSettlements < Resources
    def initialize(oauth2_client)
      super(oauth2_client, '/organization_intermediate_settlements')
    end
  end
end
