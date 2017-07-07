class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status] # Without using the before_action method, we would have to include the code present in set_blog method in each one of the spots in the array.
  # So whenever we have identical code, it's best to put it in a method and use it in a before_action method such as above.
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all
  layout "blog"
  # GET /blogs
  # GET /blogs.json
  #Whenever we go to localhost:3000/blogs, this index action is what is referenced.
  def index
    @blogs = Blog.all
    @page_title = "Blog Section"
    #@blogs = Blog.limit(1) would only show us Blog #1 or localhos,t:3000/blogs/1
  end

  # GET /blogs/1
  # GET /blogs/1.json
  # This is going to show the particular blog post that we'd click on.
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  # This creates a new instance of the blog, not an entirely new blog.
  # So this would make Blog blog = new Blog() with empty parameters, where the create action will fill in the parameters (title and body)
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    # Just like new and create, edit is connected to update.
  end

  # POST /blogs
  # POST /blogs.json
  def create
    # Unlike the new action, create takes the formal parameters we typed in "title" and "body".
    # This is why when clicking "New" it leads us to the "New Blog" page without actually creating a new blog, rather a new instance.
    # Once we fill the parameters and hit "Create", the create method will be called which will take the parameters we entered
    # using (blog_params) and will perform validation logic (respond_to).
    @blog = Blog.new(blog_params)
 
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_status

    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated.'
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # This is more of a variable that tells any method using blog_params that this variable fetches :title and :body
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
