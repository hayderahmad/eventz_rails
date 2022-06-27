class ApplicationController < ActionController::Base
    private
        def current_user
            User.find(session[:user_id])
        end
        def require_signin
            unless session[:user_id]
                # session[:intended_url] = request.original_url
                puts "#{request.url}"
                redirect_to new_session_path, alert: "please sign in first"
            end
        end
        def require_admin
            user = User.find(session[:user_id])
            unless user.admin?
                redirect_to events_path, alert: "Unauthorized access"
            end
        end
end
