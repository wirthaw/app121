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
  
  def create
		@reservation_time_list = []
		@new_reservations =[]
		@date = params[:reservation_date]
		@participants = params[:number_of_participants]
		@user_id = params[:user_id]
		@starttime =""
		@endtime = ""
		@invalid =false;
		
	Court.all.each do |court| 		
	    @starttime =""
		@endtime = ""
		
		@reservation_time_list = params[:reservation]["court_#{court.id}_times"].select{ |x| x[1] == '1'}.sort_by {|x| x[0]}
		@starttime = @reservation_time_list[0]
		@endtime = @reservation_time_list[@reservation_time_list.count-1]
		
		if  @starttime != nil
			@temp_reservation = Reservation.new(:end_time => @endtime, :start_time => @starttime, :reservation_date => @date, :user_id => @user_id, :number_of_participants => @participants)
			@temp_reservation.courts << court
			if @temp_reservation.save
				@new_reservations << @temp_reservation
			else
				@invalid = true
				break
			end
		end
	end
	
	if @invalid == true
		render(:new)
		flash[:notice] = "Could not save Reservations"
	end
	
		
  end
  
  
end
