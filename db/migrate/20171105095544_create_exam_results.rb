class CreateExamResults < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_results do |t|
      t.references :answer, foreign_key: true
      t.references :user_exam, foreign_key: true

      t.timestamps
    end
  end
end
