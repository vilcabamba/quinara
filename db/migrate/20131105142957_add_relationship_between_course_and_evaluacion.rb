class AddRelationshipBetweenCourseAndEvaluacion < ActiveRecord::Migration
  def change
    add_column :evaluacions, :course_id, :integer, references: :courses
  end
end
