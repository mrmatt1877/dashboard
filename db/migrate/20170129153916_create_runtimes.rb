class CreateRuntimes < ActiveRecord::Migration[5.0]
  def change
    create_table :runtimes do |t|
      t.time :start_time
      t.time :end_time
      t.date :date
      t.references :mrpjob, foreign_key: true

      t.timestamps
    end
  end
end
