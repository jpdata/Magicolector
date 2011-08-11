class CreateColecciones < ActiveRecord::Migration
  def self.up
    create_table :colecciones do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :colecciones
  end
end
