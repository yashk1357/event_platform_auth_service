class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :provider, null: true
      t.string :password_digest, null: false
      t.string :role, default: 'user'
      t.string :uid, null: true

      t.timestamps
      t.index :email, unique: true
    end
  end
end
