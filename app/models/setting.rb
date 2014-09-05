class Setting < ActiveRecord::Base
  belongs_to :user
  belongs_to :agency
  belongs_to :non_directional_route
  belongs_to :directional_route
  belongs_to :stop

end