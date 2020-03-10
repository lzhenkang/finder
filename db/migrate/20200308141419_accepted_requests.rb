class AcceptedRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :accepted_requests do |t|
        t.references :user
        t.references :request
        t.timestamps
    end
  end
end