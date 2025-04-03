# app/controllers/stores/products_controller.rb
module Stores
  class ProductsController < ApplicationController
    def index
      @products = Product.all
    end
  end
end
