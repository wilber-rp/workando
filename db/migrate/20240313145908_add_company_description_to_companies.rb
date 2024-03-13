class AddCompanyDescriptionToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :company_description, :string
  end
end
