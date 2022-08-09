class Api::V1::SessionsController < Api::V1::ApiController
    
    def create
        @user=User.find_by(email:params[:email])
        @token=  SecureRandom.hex(10)        
        # @passwd=BCrpyt::Password.create(params[:password]) 
        if  @user && @user.valid_password?(params[:password])
            @user.token=@token
            if@user.save
                
            end
        else
            render json: {massage:"not log in"}
        end
    end

    def destroy
        @user=User.find_by(token: request.headers["token"])
        # byebug
        if @user.blank?
            render json: {massage: "Unauthorize"}
        else
            @user.token=nil
            @user.save
            render json: {massage: "Logout successfully"}
        end
    end

end