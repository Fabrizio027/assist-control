class ReportsController < ApplicationController

    def index
        @employee = User.joins(:tags).where("tags.name LIKE 'Empleado'")
    end

    def generate_report
        @codigo_empleado = params[:employee_id]
        @mes_anio = params[:month_year]
        @checks = Check.where("user_id = #{@codigo_empleado} AND entry_time LIKE '%#{@mes_anio}%'").order(:entry_time)
        
        
        
    end
end