class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :username, :email, :password
      user.timestamps
    end
    create_table :resource_posts do |post|
      post.string :title, :author, :url, :text
    end
    create_table :eats_posts do |post|
      post.string :name, :address, :text
    end
    create_table :comments do |comment|
      comment.string :text
    end
  end
end
