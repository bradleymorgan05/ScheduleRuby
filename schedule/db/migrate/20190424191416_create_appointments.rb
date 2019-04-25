class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.numeric :start_time
      t.numeric :end_time
      t.string :description
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
