class AddColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :Events,:title,:string
    add_column :Events,:body,:text
  end
end
