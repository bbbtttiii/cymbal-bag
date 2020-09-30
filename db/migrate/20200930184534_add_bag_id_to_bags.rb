class AddBagIdToBags < ActiveRecord::Migration[6.0]
  def change
    add_column :bags, :bag_id, :integer
  end
end
