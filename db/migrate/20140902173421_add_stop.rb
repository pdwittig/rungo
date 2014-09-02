class AddStop < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :name
      t.string :code
      t.float :longitude
      t.float :latitude

      t.integer :route_id

      t.timestamps
    end
  end
end
