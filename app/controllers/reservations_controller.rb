class ReservationsController < ApplicationController
  def index
  
  end
  
  def load_court_reservations
  	@date = params[:date]
  	if @date != nil 
  		@reservation_date = Date.parse(@date)
  	end
    @close_time = Time.parse('11:59pm')
    @current_time = Time.parse('12:00pm')
    @time_array = []
    
    while @current_time < @close_time
    	@time_array << @current_time
    	@current_time = (@current_time + 60*30)
    end
    
  	respond_to do |format|
  	    format.js {render :layout=>false}
  	end
  end
  
  def new 
    @close_time = Time.parse('11:59pm')
    @current_time = Time.parse('12:00pm')
    @time_array = []
    while @current_time < @close_time
    	@time_array << @current_time
    	@current_time = (@current_time + 60*30)
    end
    @reservation_date = Date.today
    
    
    @reservation = Reservation.new
    @reservation.reservation_date = @reservation_date
    @reservation.start_time = Time.parse('12:00pm')
    @reservation.end_time = Time.parse('2:00pm')
  end
  
  def show
	@reservation = Reservation.find(params[:id])
  end
  
  def create
    @close_time = Time.parse('11:59pm')
    @current_time = Time.parse('12:00pm')
    @time_array = []
    
    while @current_time < @close_time
    	@time_array << @current_time
    	@current_time = (@current_time + 60*30)
    end
    
    
	@reservation = Reservation.new
	@reservation.reservation_date = params[:reservation][:reservation_date]
	@reservation.start_time = params[:reservation][:start_time]
	@reservation.end_time = params[:reservation][:end_time]
	@reservation.number_of_participants = params[:reservation][:number_of_participants]
	@reservation.user_id = params[:reservation][:user_id]
	
	@reservation_courts = params[:reservation][:court_ids]
	
	if @reservation_courts != nil
		@reservation_courts.each do |court|
			if court != ""
				@temp_court = Court.find_by_id(court)
				@reservation.courts << @temp_court
			end
		end
	end
	
	if @reservation.save
      redirect_to reservation_path(@reservation)
      flash[:notice] = "Item saved successfully"
    else
      @reservation_date = @reservation.reservation_date
      render(:new)
      flash[:notice] = "Could not save Item"
    end
		
  end
  
  
end
