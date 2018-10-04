module V1
  class HomeController < ApplicationController
    skip_before_action :authorize_request, only: [:index, :show]

    # GET /
    def index
      @blogs = Blog.last(6)

      render json: @blogs
    end

  end
end