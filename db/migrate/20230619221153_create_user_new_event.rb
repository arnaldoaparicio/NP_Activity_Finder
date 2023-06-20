class CreateUserNewEvent < ActiveRecord::Migration[5.2]
  def change
    create_table :user_new_events do |t|
      t.references :user, foreign_key: true
      t.references :new_event, foreign_key: true
    end
  end
end
