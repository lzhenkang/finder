class Appointments < ActiveRecord::Migration[5.2]
  def change
        create_table :appointments do |t|
        t.references :user
        t.date
        t.text :time_slot
        t.boolean :accepted
        t.timestamps
    end
  end
end