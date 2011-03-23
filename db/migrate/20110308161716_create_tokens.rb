class CreateTokens < ActiveRecord::Migration
  def self.up
    create_table :tokens do |t|
      t.belongs_to  :client
      t.belongs_to  :user
      t.string      :scope
      # do we need to keep track of the callback url for generating an access_token
      t.string      :access_token_exchange_code
      t.string      :access_token_exchange_code_issue_date
      t.string      :access_token
      t.string      :refresh_token
      t.datetime    :expiry_date
      t.boolean     :revoked, :default => false
    end
  end

  def self.down
    drop_table :tokens
  end
end
