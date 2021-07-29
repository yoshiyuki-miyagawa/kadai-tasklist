class ApplicationController < ActionController::Base
    include SessionsHelper
        private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
end
