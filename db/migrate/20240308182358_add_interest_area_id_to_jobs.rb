class AddInterestAreaIdToJobs < ActiveRecord::Migration[7.1]
  def change
    add_column :jobs, :interest_area_id, :integer
  end
end
