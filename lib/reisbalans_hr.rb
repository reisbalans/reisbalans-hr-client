require 'yaml'
require_relative 'reisbalans_hr/client'

module ReisbalansHR
  def self.client(base_url: config['base_url'], client_id: config['client_id'], client_secret: config['client_secret'])
    Client.new(base_url: base_url, client_id: client_id, client_secret: client_secret)
  end

  private

  def self.config
    config_path = File.expand_path("../../config/env.yml", __FILE__)
    @config ||= YAML.load(File.open(config_path))
  end
end
