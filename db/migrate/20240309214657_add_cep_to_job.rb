class AddCepToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :cep, :string
  end
end
