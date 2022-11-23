class AddDescriptionToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :description, :text
    add_column :cars, :location, :string
    add_column :cars, :image_url, :string
  end
end
