class ChangeJobseekersNameToCitext < ActiveRecord::Migration[7.0]
  def change
    enable_extension("citext")

    change_table :jobseekers do |t|
      t.change :name, :citext
    end
  end
end
