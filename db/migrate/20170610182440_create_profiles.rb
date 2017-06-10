class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles, id: :uuid, default: "uuid_generate_v4()", force: true do |t|
      t.string :name, null: false
      t.date :date_of_birth, null: false
      t.string :gender, null: false
      t.string :marital_status
      t.integer :children, null: false, default: 0
      t.uuid :city_id
      t.string :profession
      t.string :occupation
      t.string :occupation_area
      t.string :hobbies
      t.text :goals
      t.text :about
      t.uuid :user_id

      t.timestamps
    end
  end
end
