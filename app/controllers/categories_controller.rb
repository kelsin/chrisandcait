class CategoriesController < ApplicationController
  layout "admin"
    before_filter :authenticate

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(params[:category])
        @category.save

        redirect_to :controller => :guests, :action => :index
    end
end
