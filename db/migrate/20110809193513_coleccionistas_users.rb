class ColeccionistasUsers < ActiveRecord::Migration
  def self.up
    create_table :coleccionistas_users, :id=>false do |t|
      t.references :user
      t.references :coleccionista
    end
    add_index :coleccionistas_users , [:user,:coleccionista]
  end

  def self.down
     drop_table :coleccionistas_users
  end
end
