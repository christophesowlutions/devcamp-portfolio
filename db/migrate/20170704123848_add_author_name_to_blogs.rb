class AddAuthorNameToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :author_name, :string
  end
end
