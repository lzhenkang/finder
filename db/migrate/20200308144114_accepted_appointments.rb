class AcceptedAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :accepted_appointments do |t|
        t.references :user
        t.references :appointment
        t.timestamps
    end
  end
end