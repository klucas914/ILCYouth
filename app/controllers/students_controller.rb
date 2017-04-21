class StudentsController < ApplicationController
  def index
    @students = Student.all
    @groups = Group.all
  end
  
  def show
    @student = Student.find(params[:id])
    @groups = Group.all
  end

  def new
    @student = Student.new
    @groups = Group.all
  end

  def edit
    @student = Student.find(params[:id])
    @groups = Group.all
  end

  def create
  	
    @student = Student.new(student_params)

  	if @student.save
  	  redirect_to @student
    else
      render 'new'
    end
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end
  
  def check_in
    event = Event.find(params[:id])
    student = Student.find(params[:id])
    @check_in = CheckIn.new(event: event, student: student)
    if @check_in.save
      flash[:alert] = "#{student.first_name} is here!"
    else
      flash[:alert] = "There was an error checking in. Please try again."
    end  
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
 
    redirect_to students_path
  end

  private
    def student_params
    	params.require(:student).permit(:first_name, :surname, group_ids: [])
    end
end
