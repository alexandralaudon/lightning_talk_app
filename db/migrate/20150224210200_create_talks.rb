class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :when
      t.string :presenter
      t.string :topic
      t.boolean :available

      t.timestamps  null: false
    end
  end
end
