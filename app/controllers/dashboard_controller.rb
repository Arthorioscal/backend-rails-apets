class DashboardController < ApplicationController
    before_action :authenticate_devise_user!
    
    def index
        @user = current_devise_user
        @animals = Animal.all
    end

    private  
end