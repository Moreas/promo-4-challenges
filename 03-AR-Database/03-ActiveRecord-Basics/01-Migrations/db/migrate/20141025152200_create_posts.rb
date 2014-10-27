class CreatePosts < ActiveRecord::Migration
  def change
    # TODO: your code here to create the posts table
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.timestamps  # add 2 columns, `created_at` and `updated_at`
    end
  end
end
