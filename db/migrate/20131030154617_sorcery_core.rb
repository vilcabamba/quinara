class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      # sorcery fields:
      t.string :username,         :null => false  # if you use another field as a username, for example email, you can safely remove this field.
      t.string :email,            :default => nil # if you use this field as a username, you might want to make it :null => false.
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      # user info:
      t.string :nombres
      t.string :apellidos
      t.date :fecha_nacimiento
      t.string :identificacion
      t.string :tipo_identificacion
      t.string :direccion
      t.string :telefono

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
    add_index :users, :identificacion
  end

  def self.down
    remove_index :users, :username, unique: true
    remove_index :users, :email, unique: true
    remove_index :users, :identificacion
    drop_table :users
  end
end
