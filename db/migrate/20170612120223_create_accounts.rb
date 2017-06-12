class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :uid
      t.string :provider
      t.string :email
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
