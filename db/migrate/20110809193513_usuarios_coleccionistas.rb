class UsuariosColeccionistas < ActiveRecord::Migration
  def self.up
    create_table :usuarios_coleccionistas, :id=>false do |t|
      t.references :usuario
      t.references :coleccionista
    end
  end

  def self.down
     drop_table :usuarios_coleccionistas
  end
end
