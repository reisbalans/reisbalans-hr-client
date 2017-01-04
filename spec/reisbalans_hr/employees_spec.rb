require_relative "../spec_helper"
require_relative "../../lib/reisbalans_hr"

describe ReisbalansHR::Employees, :integration do
  let(:client) { ReisbalansHR.client }

  describe "#employee" do
    describe "#index" do
      subject { client.employees.index }
      it do
        is_expected.to eq(
          [{"employee"=>
             {"id"=>2,
              "employee_number"=>"011011",
              "email"=>"daan.reiziger@workaway.nl",
              "gender"=>"M",
              "initials"=>"D",
              "first_name"=>"Daan",
              "infix"=>nil,
              "last_name"=>"Reiziger",
              "date_of_birth"=>"1987-01-04",
              "phone_number"=>nil,
              "home_street"=>"Vogelkerslaan",
              "home_street_number"=>"30",
              "home_street_number_suffix"=>nil,
              "home_zipcode"=>"2251GJ",
              "home_city"=>"Voorschoten",
              "work_street"=>"Barchman Wuytierslaan",
              "work_street_number"=>"10",
              "work_street_number_suffix"=>nil,
              "work_zipcode"=>"3818LH",
              "work_city"=>"Amersfoort",
              "works_on"=>"1,2,3,4,5",
              "invite_at"=>"2017-01-03T12:17:07+01:00",
              "accounting_profiles"=>[],
              "manager"=>
               {"id"=>1,
                "email"=>"ronald.rotteveel@workaway.nl",
                "employee_number"=>nil},
              "budget_profiles"=>
               [{"starts_on"=>"2013-01-01",
                 "ends_on"=>nil,
                 "budget_group_name"=>"Budgethouders"}]}},
           {"employee"=>
             {"id"=>1,
              "employee_number"=>nil,
              "email"=>"ronald.rotteveel@workaway.nl",
              "gender"=>"M",
              "initials"=>"D",
              "first_name"=>"Ronald",
              "infix"=>nil,
              "last_name"=>"Rotteveel",
              "date_of_birth"=>"1987-01-04",
              "phone_number"=>nil,
              "home_street"=>"Vogelkerslaan",
              "home_street_number"=>"30",
              "home_street_number_suffix"=>nil,
              "home_zipcode"=>"2251GJ",
              "home_city"=>"Voorschoten",
              "work_street"=>"Barchman Wuytierslaan",
              "work_street_number"=>"10",
              "work_street_number_suffix"=>nil,
              "work_zipcode"=>"3818LH",
              "work_city"=>"Amersfoort",
              "works_on"=>"1,2,3,4,5",
              "invite_at"=>"2017-01-03T12:17:07+01:00",
              "accounting_profiles"=>
               [{"starts_on"=>"2017-01-03",
                 "ends_on"=>nil,
                 "cost_center"=>"123",
                 "department"=>"IT"}],
              "manager"=>nil,
              "budget_profiles"=>
               [{"starts_on"=>"2014-01-01",
                 "ends_on"=>nil,
                 "budget_group_name"=>"Budgethouders"}]}}]
        )
      end
    end

    describe "#show" do
      subject { client.employees.show(2) }
      its(["employee", "email"]) { is_expected.to eq("daan.reiziger@workaway.nl") }
    end

    describe "#create" do
      let(:employee_params) do
        {
          employee: {
            email: "rudolf@reisbalans.nl",
            first_name: "Rudolf",
            last_name: "Rendier",
            initials: "R",
            infix: nil,
            employee_number: "RR123",
            works_on: "1,2,3,4,5",
            manager_id: nil,
            is_manager: false,
            home_street: "Kalverstraat",
            home_street_number: 1,
            home_street_number_suffix: nil,
            home_city: "Amsterdam",
            home_zipcode: "1111AA",
            work_street: "Cruquiusweg",
            work_street_number: 1,
            work_street_number_suffix: nil,
            work_city: "Amsterdam",
            work_zipcode: "1234AB",
            invite_at: Date.new(2020, 1, 1),
            date_of_birth: Date.new(1987, 11, 15),
            gender: "M",
            phone_number: "0611111111",
            budget_profiles_attributes: {
              0 => {
                starts_on: Date.new(2020, 1, 1),
                ends_on: nil,
                commute_monthly_money_budget: 100,
                commute_monthly_km_budget: 200,
                budget_group_name: "Budgethouders"
              }
            }
          }
        }
      end

      it "creates the employee" do
        client.employees.create(employee_params)
      end
    end

    describe "#update" do
      let(:employee_params) do
        {
          employee: {
            email: "alfons@reisbalans.nl",
            first_name: "Alfons",
            last_name: "Achter",
            initials: "A",
            infix: nil,
            employee_number: "RR123",
            works_on: "1,2,3,4,5",
            manager_id: nil,
            is_manager: false,
            home_street: "Kalverstraat",
            home_street_number: 1,
            home_street_number_suffix: nil,
            home_city: "Amsterdam",
            home_zipcode: "1111AA",
            work_street: "Cruquiusweg",
            work_street_number: 1,
            work_street_number_suffix: nil,
            work_city: "Amsterdam",
            work_zipcode: "1234AB",
            invite_at: Date.new(2020, 1, 1),
            date_of_birth: Date.new(1987, 11, 15),
            gender: "M",
            phone_number: "0611111111",
            budget_profiles_attributes: {
              0 => {
                starts_on: Date.new(2020, 1, 1),
                ends_on: nil,
                commute_monthly_money_budget: 100,
                commute_monthly_km_budget: 200,
                budget_group_name: "Budgethouders"
              }
            }
          }
        }
      end

      it "creates and updates the employee" do
        client.employees.create(employee_params)
        id = client.employees.index.find { |x| x["employee"]["email"] == "alfons@reisbalans.nl" }["employee"]["id"]
        client.employees.update(id, {employee: {gender: 'F'}})
        expect(client.employees.show(id)["employee"]["gender"]).to eq("F")
      end
    end
  end
end
