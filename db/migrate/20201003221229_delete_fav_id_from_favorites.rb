class DeleteFavIdFromFavorites < ActiveRecord::Migration[6.0]
  def change
    remove_column :favorites, :favorite_id
  end
end
