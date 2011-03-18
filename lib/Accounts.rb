require 'rubygems'
require 'httparty'

class Accounts
  include HTTParty
  #doesn't seem to pick up env variable correctly if I set it here
  #headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  format :json
  #debug_output $stderr

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    @root_url = ENV['sfdc_instance_url']+"/services/data/v"+ENV['sfdc_api_version']
  end

  def self.get_first_hundred
    Accounts.set_headers
    get(Accounts.root_url+"/query/?q=#{CGI::escape('SELECT Name, Id from Account LIMIT 100')}")
  end

  def self.get_all_by_last_name(last_name)
    #TODO
  end

end
