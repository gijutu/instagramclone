class CreateFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :feeds do |t|
      t.text :image
      t.text :content
      t.references :user

      t.timestamps
    end
  end
end
