class CreateUbicaciones < ActiveRecord::Migration
  def self.up
    create_table :ubicaciones do |t|
      t.integer :cantidad
      t.string :observaciones
      t.references :carta
      t.references :mazo
      t.timestamps
    end
    add_index :ubicaciones,[:carta_id,:mazo_id]
  end

  def self.down
    drop_table :ubicaciones
  end
end
