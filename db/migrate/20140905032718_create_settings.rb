class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.integer :agency_id
      t.integer :directional_route_id
      t.integer :non_directional_route_id
      t.integer :stop_id
      t.datetime :departure

      t.timestamps
    end
  end
end
