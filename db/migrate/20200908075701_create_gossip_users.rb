class CreateGossipUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :gossip_users do |t|
      t.references :gossip, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
