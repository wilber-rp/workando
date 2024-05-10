class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :cpf, :string
    add_column :users, :company_name, :string
    add_column :users, :cnpj, :string
    add_column :users, :phone, :string
    add_column :users, :zip, :string
    add_column :users, :address, :string
    add_column :users, :number, :string
    add_column :users, :complement, :string
    add_column :users, :neighborhoot, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :lat, :float
    add_column :users, :long, :float
  end
end
