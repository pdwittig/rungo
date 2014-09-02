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

  def routes_for_agency agency_name
    routes_uri = '/GetRoutesForAgency.aspx'
    params = { query: { token: @api_key, agencyName: agency_name } }
    response = self.class.get(routes_uri, params)
    return response["RTT"]['AgencyList']['Agency']['RouteList']['Route']
  end
end