class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles, if_not_exists: true do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
