class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :require_user_logged_in
        private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def require_user_logged_in
        unless logged_in?
            redirect_to login_url
        end
    end
    
    
end
