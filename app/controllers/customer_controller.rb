class CustomerController < ApplicationController
    def index
        @products=Product.all
    end

    
end
