class UsersController < ApplicationController
    

    def index 
       @users = User.joins(:tags).where("tags.name LIKE 'Empleado'")
    end

    
    
end