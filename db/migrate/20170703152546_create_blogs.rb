class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    ##this came after using the rails g scaffold Blog title:string body:text command which created the Blog table and title and text.
    create_table :blogs do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
