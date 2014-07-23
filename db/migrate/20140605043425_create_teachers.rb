class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.boolean :active, :default => true
      t.string :name
      t.integer :age
      t.string :gender
      t.text :address
      t.timestamps
    end
  end
end