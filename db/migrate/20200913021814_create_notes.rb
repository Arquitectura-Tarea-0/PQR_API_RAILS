class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
    	t.text :description
    	t.references :user, foreign_key: true
    	t.references :request, foreign_key: true
    end
  end
end
