class CreateGrades < ActiveRecord::Migration[6.1]
  def change
    create_table :grades do |t|
      t.integer :test1
      t.integer :test2
      t.integer :test3
      t.integer :exam
      t.string :situation
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
