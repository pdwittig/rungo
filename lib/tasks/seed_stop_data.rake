namespace :seed do

  desc "Get a list of all stops and populate db"
  task populate_stop_data: :environment do
    route_count = 0
    api_client = TransitApiClient.new
    agencies = Agency.all
    agencies.each do |agency|
      p "*********Agency: #{agency.name}************"
      if agency.directional
        agency.non_directional_routes.each do |non_directional_route|
          non_directional_route.directional_routes.each do |directional_route|
            p "------route count: #{route_count}"
            p "------nondir name: #{non_directional_route.name}"
            p "------nondir code: #{non_directional_route.code}"
            p "------dir name: #{directional_route.name}"
            p "------dir code: #{directional_route.code}"
            stops = api_client.stops_for_agency_and_route(agency.name,
              non_directional_route.code,
              directional_route.code)
            stops = [stops] if !stops.is_a?(Array)
            stops.each do |stop|
              directional_route.stops.create(name: stop['name'],
                code: stop['StopCode'])
            end
            route_count += 1
            sleep 2
          end
        end
      else
        agency.non_directional_routes.each do |non_directional_route|
          p "------route count: #{route_count}"
          p "------nondir name: #{non_directional_route.name}"
          p "------nondir code: #{non_directional_route.code}"
          stops = api_client.stops_for_agency_and_route(agency.name,
            non_directional_route.code)
          stops = [stops] if !stops.is_a?(Array)
          stops.each do |stop|
            non_directional_route.stops.create(name: stop['name'],
              code: stop['StopCode'])
          end
          route_count += 1
          sleep 2
        end
      end
    end

  end
end