class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :nivel
      t.integer :numero

      t.timestamps
    end
  end
end
