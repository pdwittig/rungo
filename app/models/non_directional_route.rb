class NonDirectionalRoute < Route
  belongs_to :agency
  has_many :directional_routes
end