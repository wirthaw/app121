class CreateCourtsReservationsTable < ActiveRecord::Migration
  def up
    create_table :courts_reservations ,:id => false do |t|
      t.references :court, :reservation  
    end
    add_index :courts_reservations, [:court_id, :reservation_id]

  end

  def down
  end
end
