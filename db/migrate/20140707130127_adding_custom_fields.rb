class AddingCustomFields < ActiveRecord::Migration
  def change
  	add_column :users, :cnic, :string
  	add_column :users, :address, :string
  	add_column :users, :add_longitude, :float
    add_column :users, :add_latitude, :float
    add_column :users, :gender, :string
    add_column :users, :phone, :string

  end

end
