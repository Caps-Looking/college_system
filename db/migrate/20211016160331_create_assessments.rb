class CreateAssessments < ActiveRecord::Migration[6.1]
  def change
    create_table :assessments do |t|
      t.integer :test1
      t.integer :test2
      t.integer :test3

      t.timestamps
    end
  end
end
