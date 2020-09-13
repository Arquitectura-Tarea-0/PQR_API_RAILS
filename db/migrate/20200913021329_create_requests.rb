class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
    	t.integer :request_state, default: 0
    	t.string :request_type, default: "request"
    	t.string :subject
    	t.text   :description
    	t.datetime :responded_at
    	t.references :user, foreign_key: true

    	t.timestamps
    end
  end
end
