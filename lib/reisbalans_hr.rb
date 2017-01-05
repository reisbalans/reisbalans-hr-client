require 'yaml'
require_relative 'reisbalans_hr/client'

module ReisbalansHR
  def self.client(base_url:, client_id:, client_secret:)
    Client.new(base_url: base_url, client_id: client_id, client_secret: client_secret)
  end
end
