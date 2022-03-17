class ApplicationController < ActionController::Base
    
    layout :layout_by_resource
    before_action :authenticate_user!
    
      def after_sign_in_path_for(resource)
        if current_user
           if resource.admin?
             root_path
           else
            sign_out current_user
            new_user_session_path
           end
        end
      end


    private 
    def layout_by_resource
        if devise_controller?
            "devise"
        else
            "application"
           
        end
    end
end

