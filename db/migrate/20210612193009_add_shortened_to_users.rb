class AddShortenedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :shortened, :string
  end
end
