class ChangeCymbalProperties < ActiveRecord::Migration[6.0]
  def change
    rename_column :cymbals, :type, :cym_type
    add_column :cymbals, :cym_model, :string
  end
end