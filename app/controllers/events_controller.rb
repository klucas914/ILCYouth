class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @groups = @event.groups
  end

  def new
    @event = Event.new
    @groups = Group.all
  end

  def edit
    @event = Event.find(params[:id])
    @groups = Group.all
  end

  def create
  	@event = Event.new(event_params)

  	if @event.save
  	  redirect_to @event
    else
      render 'new'
    end
  end

  def check_in
    event = Event.find(params[:id])
    student = Student.find(params[:id])
    @check_in = CheckIn.new(event: event, student: student )
    if @check_in.save
      flash[:alert] = "#{student.first_name} is here!"
    else
      flash[:alert] = "There was an error checking in. Please try again."
    end  
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
 
    redirect_to events_path
  end

  private
    def event_params
    	params.require(:event).permit(:name, :date, :description, group_ids: [])
    end


end
