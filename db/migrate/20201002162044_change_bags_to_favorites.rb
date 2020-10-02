class ChangeBagsToFavorites < ActiveRecord::Migration[6.0]
  def change
    rename_table :bags, :favorites
  end
end
