require_relative "../spec_helper"
require_relative "../../lib/reisbalans_hr"

describe ReisbalansHR::OrganizationIntermediateSettlements, :integration do
  let(:client) { ReisbalansHR.client }

  describe "#index" do
    subject { client.organization_intermediate_settlements.index }

    it do
      is_expected.to eq([{
        "organization_intermediate_settlement"=> {
          "id"=>1,
          "effective_on"=>"2017-01-01",
          "committed_at"=>"2017-01-04T13:14:02+01:00",
          "amount"=>"0.0"
        }
      }])
    end
  end

  describe "#show" do
    let(:index) { client.organization_intermediate_settlements.index }
    let(:id) { index.first["organization_intermediate_settlement"]["id"] }
    subject { client.organization_intermediate_settlements.show(id) }

    it do
      is_expected.to eq({
        "organization_intermediate_settlement" => {
          "id" => 1,
          "effective_on" => "2017-01-01",
          "committed_at" => "2017-01-04T13:14:02+01:00",
          "amount" => "0.0",
          "employee_intermediate_settlements" => [
            {
              "id" => 44,
              "employee" => {
                "id" => 2, "email" => "daan.reiziger@workaway.nl", "employee_number" => "011011"
              }
            }, {
              "id" => 45,
              "employee" => {
                "id" => 1, "email" => "ronald.rotteveel@workaway.nl", "employee_number" => nil
              }
            }
          ]
        }
      })
    end
  end
end
