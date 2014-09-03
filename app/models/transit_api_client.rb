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
    route_uri = '/GetRoutesForAgency.aspx'
    params = { query: { token: @api_key, agencyName: agency_name } }
    response = self.class.get(route_uri, params)
    return response["RTT"]['AgencyList']['Agency']['RouteList']['Route']
  end

  def stops_for_agency_and_route agency_name, non_directional_route_code, directional_route_code = nil
    stop_uri = '/GetStopsForRoute.aspx'
    if directional_route_code == nil
      route_query = combine_params_with_tilda(agency_name, non_directional_route_code)
      params = { query: { token: @api_key, routeIDF: route_query } }
      response = self.class.get(stop_uri, params)
      return response["RTT"]['AgencyList']['Agency']['RouteList']['Route']['StopList']['Stop']
    else
      route_query = combine_params_with_tilda(agency_name, non_directional_route_code, directional_route_code)
      params = { query: { token: @api_key, routeIDF: route_query } }
      response = self.class.get(stop_uri, params)
      return response["RTT"]['AgencyList']['Agency']['RouteList']['Route']['RouteDirectionList']['RouteDirection']['StopList']['Stop']
    end
  end

  private 
  def combine_params_with_tilda *args
    args.join('~')
  end
end