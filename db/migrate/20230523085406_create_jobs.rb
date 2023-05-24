class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :required_skills

      t.timestamps null: true
    end
  end
end
