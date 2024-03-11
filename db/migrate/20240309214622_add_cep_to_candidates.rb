class AddCepToCandidates < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :cep, :string
  end
end
