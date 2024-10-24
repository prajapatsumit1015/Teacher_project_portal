class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :subject
      t.string :marks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
