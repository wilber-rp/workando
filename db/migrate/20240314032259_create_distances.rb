class CreateDistances < ActiveRecord::Migration[7.1]
  def change
    create_table :distances do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.float :distance

      t.timestamps
    end
  end
end
