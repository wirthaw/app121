class CreateItemReservationsTable < ActiveRecord::Migration
  def up
    create_table :items_reservations, :id => false do |t|
    	t. references :item, :reservation
  	end
  	add_index :items_reservations, [:item_id, :reservation_id]
  end

  def down
  end
end
