class CreateJobseekers < ActiveRecord::Migration[7.0]
  def change
    create_table :jobseekers do |t|
      t.string :name, unique: true
      t.text :skills

      t.timestamps null: true
    end
  end
end
