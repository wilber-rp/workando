class AddAddressToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :number, :string
    add_column :jobs, :complement, :string
    add_column :jobs, :neighborhood, :string
    add_column :jobs, :state, :string
  end
end
