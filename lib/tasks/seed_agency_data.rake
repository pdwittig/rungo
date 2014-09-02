namespace :seed do

  desc 'Get a list of all agencies and populte db'
  task populate_agency_data: :environment do
    api_client = TransitApiClient.new
    agencies = api_client.agencies
    agencies.each do |agency|
      agency['HasDirection'] == "True" ? directional = true : directional = false
      Agency.create name: agency['Name'], directional: directional, mode: agency['Mode']
    end
  end
  
end