namespace :seed do
  
  desc 'get a list of all routes and populate db'
  task populate_route_data: :environment do
    api_client = TransitApiClient.new
    agencies = Agency.all
    agencies.each do |agency|
      # p "**********#{agency.name}*****************"
      routes_data = api_client.routes_for_agency(agency.name)
      routes_data.each do |route_data|
        non_directional_route = agency.non_directional_routes.
          create(name: route_data['Name'], code: route_data['Code'])

        if agency.directional
          directional_routes_data = route_data['RouteDirectionList']['RouteDirection']
          directional_routes_data = [directional_routes_data] if !directional_routes_data.is_a?(Array)
          directional_routes_data.each do |directional_route_data|
            # p directional_route_data
            directional_route = non_directional_route.directional_routes.
              create(name: directional_route_data['Name'], code: directional_route_data['Code'])
          end
        end
      end
      sleep 5
    end
  end

end
