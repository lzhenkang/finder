class Requests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
        t.references :user
        t.text :description
        t.text :location
        t.timestamps
        t.boolean :accepted
    end
  end
end