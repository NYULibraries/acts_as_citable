class CreateRecordChangedFields < ActiveRecord::Migration
  def change
    create_table :record_changed_fields do |t|
      t.string :data
      t.string :from_format

      t.timestamps
    end
  end
end
