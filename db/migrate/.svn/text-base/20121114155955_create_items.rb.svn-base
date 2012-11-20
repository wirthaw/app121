class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item_number
      t.integer :value
      t.string :description
      t.date :purchase_date
      t.integer :category_id

      t.timestamps
    end
  end
end
