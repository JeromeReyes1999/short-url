class CreateBarangays < ActiveRecord::Migration[6.1]
  def change
    create_table :barangays do |t|
      t.string :name
      t.string :code
      t.belongs_to :city_municipality
      t.timestamps
    end
  end
end
