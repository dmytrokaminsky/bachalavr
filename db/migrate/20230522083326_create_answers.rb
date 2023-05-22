class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      belongs_to :questions
      t.string :title
      t.boolean :correctness
      t.integer :question_id

      t.timestamps
    end
  end
end