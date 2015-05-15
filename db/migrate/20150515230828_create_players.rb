class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :height
      t.boolean :retired
      t.boolean :hall_of_fame

      t.timestamps null: false
    end
  end
end
