class CreateCustomCitableRecords < ActiveRecord::Migration
  def change
    create_table :custom_citable_records do |t|
      t.string :my_data
      t.string :my_format

      t.timestamps null: false
    end
  end
end
