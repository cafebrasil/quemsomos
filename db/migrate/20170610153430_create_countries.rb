class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries, id: :uuid, default: "uuid_generate_v4()", force: true do |t|
      t.string :name, null: false, index: { unique: true}
      t.string :iso2_code, null: false, index: { unique: true}
      t.string :iso3_code, null: false, index: { unique: true}
      t.string :currency, null: false

      t.timestamps
    end
  end
end
