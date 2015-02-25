class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :presenter
      t.string :topic
      t.date   :talk_date
      t.time   :talk_time

      t.timestamps  null: false
    end
  end
end
