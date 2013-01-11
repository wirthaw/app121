class ReservationsController < ApplicationController
  def index
  
  end
    
  def show
	@reservation = Reservation.find(params[:id])
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
    @reservation_start_time = Time.parse('12:00pm')
    @reservation_end_time = Time.parse('11:30pm')
    
    @reservation = Reservation.new
    @reservation.reservation_date = @reservation_date
    @reservation.start_time = @reservation_start_time
    @reservation.end_time = @reservation_end_time
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
	
	@reservation_items = params[:items]
	@reservation_courts = params[:reservation][:court_ids]
	
	if @reservation_courts != nil
		@reservation_courts.each do |court|
			if court != ""
				@temp_court = Court.find_by_id(court)
				@reservation.courts << @temp_court
			end
		end
	end
	
	if @reservation_items != nil
		@reservation_items.each do |i|
			@temp_item = Item.find_by_id(i)
			@reservation.items << @temp_item
		end
	end
	
	if @reservation.save
      redirect_to reservation_path(@reservation)
      flash[:notice] = "Item saved successfully"
    else
      @reservation_date = @reservation.reservation_date
      @reservation_start_time = @reservation.start_time
      @reservation_end_time = @reservation.end_time
      render(:new)
      flash[:notice] = "Could not save Item"
    end
		
  end
  
  def destroy
    @r = Reservation.find(params[:id])
    if @r.destroy
      redirect_to "/reservations/search"
      flash[:notice] = "Category has been removed"
    else
      redirect_to "/reservations/search"
      flash[:error] = "Category could not be removed" 
    end
  end
  
  def search
  	if params[:reservation] != nil
  		begin
  			date = Date.parse(params[:reservation][:reservation_date])
  		rescue
  			date = nil
  		end
  		
  		user = params[:reservation][:user_id]
  	end
  	
  	if date != nil
  		if user != ""
  			@reservations = Reservation.find(:all, :conditions => ["reservation_date = ? and user_id = ?",date,user])
  		else
  			@reservations = Reservation.find(:all, :conditions => ["reservation_date = ?",date])
  		end
  	elsif user != nil
  		@reservations = Reservation.find(:all, :conditions => [" user_id = ?",user])
  	end
  	
  end
  
  def load_equipment_reservations
    @date = params[:date]
    @start = params[:start]
  	@end = params[:end]
  	
    @reservation_date = Date.parse(@date)
    @reservation_start_time = Time.parse(@start)
    @reservation_end_time = Time.parse(@end)
  	
  	respond_to do |format|
  		format.js{render :layout=>false}
  	end
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
  
  
end
