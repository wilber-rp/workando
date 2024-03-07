class AddColumnIsCompanyToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_company, :boolean
  end
end
