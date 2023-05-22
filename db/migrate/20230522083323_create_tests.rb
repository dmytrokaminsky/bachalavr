class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|

      has_many :questions

      t.string :title
      t.string :subject
      t.datetime :time_start
      t.datetime :time_finish
      t.float :time_limit
      t.float :max_grade
      t.integer :creator_id

      t.timestamps
    end
  end
end
