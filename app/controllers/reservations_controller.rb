class ReservationsController < ApplicationController
  def index
  
  end
  
  def new 
    @close_time = Time.parse('11:59pm')
    @current_time = Time.parse('12:00pm')
    @time_array = []
    
    while @current_time < @close_time
    	@time_array << @current_time
    	@current_time = (@current_time + 60*30)
    end
    @courts = Court.all
    @reservation = Reservation.new
    @reservation.reservation_date = Date.today
  end
  
  def show
	@reservation = Reservation.find(params[:id])
  end
  
  
end
