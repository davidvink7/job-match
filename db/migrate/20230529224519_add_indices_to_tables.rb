class AddIndicesToTables < ActiveRecord::Migration[7.0]
  def change
    add_index :jobseekers, :name, unique: true, using: :btree
    add_index :jobs, :title, unique: true, using: :btree
  end
end
