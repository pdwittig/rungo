class Agency < ActiveRecord::Base
  has_many :non_directional_routes
end