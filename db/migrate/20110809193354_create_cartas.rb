class CreateCartas < ActiveRecord::Migration
  def self.up
    create_table :cartas do |t|
      t.integer :wocid
      t.integer :cantidad
      t.references :coleccion
      
      t.timestamps
    end
  end

  def self.down
    drop_table :cartas
  end
end
