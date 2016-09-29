class CreateMerits < ActiveRecord::Migration[5.0]
  def change
    create_table :merits do |t|
      t.string :username

      t.timestamps
    end
  end
end
