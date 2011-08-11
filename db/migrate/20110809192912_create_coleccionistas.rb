class CreateColeccionistas < ActiveRecord::Migration
  def self.up
    create_table :coleccionistas do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :coleccionistas
  end
end
