class AddHeadingsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :headings, :text, array: true, default: []
  end
end
