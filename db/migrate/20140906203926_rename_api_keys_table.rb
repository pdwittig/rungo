class RenameApiKeysTable < ActiveRecord::Migration
  def change
    rename_table :api_keys, :auth_tokens
  end
end
