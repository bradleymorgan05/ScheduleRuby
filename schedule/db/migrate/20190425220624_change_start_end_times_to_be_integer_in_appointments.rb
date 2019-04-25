class ChangeStartEndTimesToBeIntegerInAppointments < ActiveRecord::Migration[5.2]
  def up
    change_column :appointments, :start_time, :integer
    change_column :appointments, :end_time, :integer
  end

  def down
    change_column :appointments, :start_time, :numeric
    change_column :appointments, :end_time, :numeric
  end
end
