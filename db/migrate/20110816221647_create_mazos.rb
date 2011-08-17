class CreateMazos < ActiveRecord::Migration
  def self.up
    create_table :mazos do |t|
      t.string :nombre
      t.string :descripcion
      t.references :user
      t.references :coleccion
      t.timestamps
    end
  end

  def self.down
    drop_table :mazos
  end
end
