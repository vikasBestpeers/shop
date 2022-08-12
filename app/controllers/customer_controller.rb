class CustomerController < ApplicationController
    load_and_authorize_resource :class =>"Cart"

    def index
        @products=Product.all
    end

    
end
