class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
      t.text :content
      t.references :movie, index: true

      t.timestamps
    end
  end
end
