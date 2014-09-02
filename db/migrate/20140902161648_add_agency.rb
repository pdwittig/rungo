class AddAgency < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.boolean :directional
      t.string :mode

      t.timestamps
    end
  end
end
