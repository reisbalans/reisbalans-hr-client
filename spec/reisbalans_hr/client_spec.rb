require_relative "../spec_helper"
require_relative "../../lib/reisbalans_hr"

describe ReisbalansHR::Client, :integration do
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
              "date_of_birth"=>"1986-12-21",
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
              "invite_at"=>"2016-12-20T12:18:08+01:00",
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
              "date_of_birth"=>"1986-12-21",
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
              "invite_at"=>"2016-12-20T12:18:08+01:00",
              "accounting_profiles"=>
               [{"starts_on"=>"2016-12-20",
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
  end
end
