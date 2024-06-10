class StaticPagesController < ApplicationController
    before_action :user_already_logged_in

    def home
    end

    private

    def user_already_logged_in
        redirect_to dashboard_path if current_devise_user.present?
    end
end
  