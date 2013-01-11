class ChangeDataTypeForItemValue < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.change :value, :float
    end
  end


  def self.down
  end
end
