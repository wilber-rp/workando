class AddUserRefToJobs < ActiveRecord::Migration[7.1]
  def change
    add_reference :jobs, :user, foreign_key: true
  end
end
