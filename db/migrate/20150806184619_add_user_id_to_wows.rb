class AddUserIdToWows < ActiveRecord::Migration
  def change
    add_column :wows, :user_id, :integer
    add_index :wows, :user_id
  end
end
