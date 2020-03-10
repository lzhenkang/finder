class Comments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
        t.references :user
        t.references :appointment
        t.text :comment
        t.timestamps
    end
  end
end