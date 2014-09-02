class AddAgencyFkToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :agency_id, :integer
  end
end
