class CreateComment < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user_new_event, foreign_key: true
      t.text :body
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
