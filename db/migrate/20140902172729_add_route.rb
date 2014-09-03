class AddRoute < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :code

      t.string :type
      t.integer :non_directional_route_id

      t.timestamps
    end
  end
end
