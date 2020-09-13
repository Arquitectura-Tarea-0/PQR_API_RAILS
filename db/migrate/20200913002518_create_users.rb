class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :role, default: 1
      t.string :email, null: false

      t.timestamps
    end
  end
end
