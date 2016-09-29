class AddDescriptionToMerits < ActiveRecord::Migration[5.0]
  def change
remove_column :merits, :description
add_column :merits, :description, :text
  end
end
