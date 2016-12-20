require_relative "../spec_helper"
require_relative "../../lib/reisbalans_hr"

describe ReisbalansHR::Client, :integration do
  let(:client) { ReisbalansHR.client }

  describe "#employee" do
    describe "#index" do
      subject { client.employees.index }
      it { is_expected.to eq([{"name" => "foo"}]) }
    end

    describe "#show" do
      subject { client.employees.show(5972) }
      its(["email"]) { is_expected.to eq("elise.vanwijk@atvalley.nl") }
    end
  end
end
