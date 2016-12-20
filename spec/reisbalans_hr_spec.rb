require_relative "./spec_helper"
require_relative "../lib/reisbalans_hr"

describe ReisbalansHR do
  describe ".client" do
    subject do
      ReisbalansHR.client(
        base_url: 'http://mijn.reisbalans.nl',
        client_id: 'client123',
        client_secret: 'secret456'
      )
    end

    it { is_expected.to be_kind_of(ReisbalansHR::Client) }
    its(:base_url) { is_expected.to eq('http://mijn.reisbalans.nl') }
    its(:client_id) { is_expected.to eq('client123') }
    its(:client_secret) { is_expected.to eq('secret456') }
  end
end
