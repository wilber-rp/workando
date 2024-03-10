class AddLongToJob < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :long, :string
  end
end
