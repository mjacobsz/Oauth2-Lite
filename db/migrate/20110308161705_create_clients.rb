class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|            # Plural
      t.string      :name
      t.string      :client_id
      t.string      :client_secret
    end
  end

  def self.down
    drop_table :clients
  end
end
