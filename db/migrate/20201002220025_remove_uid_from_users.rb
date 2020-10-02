class RemoveUidFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :u_id
  end
end
