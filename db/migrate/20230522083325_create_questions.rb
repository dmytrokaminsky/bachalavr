class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|

      belongs_to :test
      has_many :answers

      t.string :title
      t.float :level
      t.integer :test_id

      t.timestamps
    end
  end
end