class TransitApiClient
  include HTTParty
  base_uri 'http://services.my511.org/Transit2.0'

  def initialize
    @api_key = ENV['511_auth_token']
  end

  def agencies
    agency_uri = '/GetAgencies.aspx'
    params = { query: { token: @api_key } }
    response = self.class.get(agency_uri, params)
    return response["RTT"]['AgencyList']['Agency']
  end
end