class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.time :start_time
      t.time :end_time
      t.string :user_id
      t.integer :number_of_participants

      t.timestamps
    end
  end
end
