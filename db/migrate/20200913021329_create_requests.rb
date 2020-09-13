class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
    	t.string :request_state
    	t.integer :request_type, default: 0
    	t.string :subject
    	t.text   :description
    	t.datetime :responded_at
    	t.references :user, foreign_key: true

    	t.timestamps
    end
  end
end
