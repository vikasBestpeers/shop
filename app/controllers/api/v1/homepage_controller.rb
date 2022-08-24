class Api::V1::HomepageController < Api::V1::ApiController
    def index
        if user_signed_in?
            if current_user.role == true
                redirect_to seller_index_path 
            else
                redirect_to customer_index_path
            end
        end
    end
end
