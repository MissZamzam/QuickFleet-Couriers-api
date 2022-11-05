class AdminController < ApplicationController

    before_action :authenticate_user!
    def index
        admin = Admin.all
        render json:admin
    end

    def show
        # current_user = User.find(session[:user_id])
        render json: current_user
    end

    private

    def this_user
        current_user 
    end
end
