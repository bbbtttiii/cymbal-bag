class ChangeBagIdToFavId < ActiveRecord::Migration[6.0]
  def change
    rename_column :favorites, :bag_id, :fav_id
  end
end
