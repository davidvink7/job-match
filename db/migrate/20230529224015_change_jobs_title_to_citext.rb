class ChangeJobsTitleToCitext < ActiveRecord::Migration[7.0]
  def change
    enable_extension("citext")

    change_table :jobs do |t|
      t.change :title, :citext
    end
  end
end
