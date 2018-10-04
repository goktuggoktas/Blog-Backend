module V1
  class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :update, :destroy]
    before_action :set_category, only: :index
    skip_before_action :authorize_request, only: [:index, :show]

    # GET /blogs
    def index
      @blogs = @category.blogs.all

      render json: @blogs
    end

    # GET /blogs/1
    def show
      render json: @blog
    end

    # POST /blogs
    def create
      @blog = Blog.new(blog_params)

      if @blog.save
        render json: @blog, status: :created, location: @blog
      else
        render json: @blog.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /blogs/1
    def update
      if @blog.update(blog_params)
        render json: @blog
      else
        render json: @blog.errors, status: :unprocessable_entity
      end
    end

    # DELETE /blogs/1
    def destroy
      @blog.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_blog
        @blog = Blog.find(params[:id])
      end

      def set_category
        @category = Category.find(params[:category_id])
      end

      # Only allow a trusted parameter "white list" through.
      def blog_params
        params.permit(:title, :content, :user_id, :tag_list)
      end
  end
end