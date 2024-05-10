class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :address
      t.float :salary

      t.timestamps
    end
  end
end
