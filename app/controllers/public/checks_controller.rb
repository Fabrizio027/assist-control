class Public::ChecksController < ApplicationController
    layout 'public'
    skip_before_action :authenticate_user!
    
    def new

    end

    def create
    
        user_id = check_params[:user_id]
        type = check_params[:type_control]
        date = check_params[:date]
        #Si mi tipo es entry
        if type == "entry"
            check = Check.where("user_id = ? AND entry_time LIKE ?", user_id, "%#{date.to_date}%")
            #Si mi variable check trae registros significa que ya ingrese mi hora de entrada
            if  check.size > 0
                flash[:alert] = "Ya realizaste tu ingreso el dia de hoy."
                redirect_to   new_public_check_path
             
                 
            else
                @check = Check.new
                @check.user_id = user_id
                @check.entry_time = date 
                @check.save
                flash[:notice] = "Ya se guardo tu hora de ingreso."
                redirect_to   new_public_check_path
            end
        #Si mi tipo es exit
        else
            check = Check.where("user_id = ? AND exit_time LIKE ?", user_id, "%#{date.to_date}%")
            check_exit_time_null = Check.where(user_id: user_id, exit_time: nil) 

            if check.size > 0
                flash[:alert] = "Ya realizaste tu salida el dia de hoy."
                redirect_to   new_public_check_path

            elsif check_exit_time_null.size == 0
                flash[:alert] = "No has ingresado tu hora de ingreso."
                redirect_to new_public_check_path

            elsif check_exit_time_null.first.entry_time > date
                flash[:alert] = "Tu hora de salida no puede ser menor a tu hora de entrada."
                redirect_to new_public_check_path

            else  
                @check = Check.where(exit_time: nil,user_id: user_id).first
                @check.exit_time = date
                hours = (@check.exit_time - @check.entry_time)/3600
                @check.hours_total = hours
                @check.save
                flash[:notice] = "Ya se guardo tu hora de salida."
                redirect_to   new_public_check_path
            end
        end
    end
    private 

    def check_params
        params.require(:check).permit(:user_id,:type_control, :date)
    end 



end

