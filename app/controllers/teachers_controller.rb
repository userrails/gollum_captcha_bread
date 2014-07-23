class TeachersController < ApplicationController
  before_action :authenticate_user!
  
  add_breadcrumb "Home", :homes_path
  
  def index
    add_breadcrumb "Teachers", teachers_path
    @teachers = Teacher.all
  end
  
  def new
    add_breadcrumb "Teachers", teachers_path
    add_breadcrumb "New Teacher", new_teacher_path
    @teacher = Teacher.new
  end
  
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save_with_captcha
      redirect_to teachers_path
    else
      render :action => :new
    end
  end
  
  def edit
    add_breadcrumb "Teachers", teachers_path    
    @teacher = Teacher.find(params[:id])
  end
  
  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      redirect_to teachers_path
    else
      render :action => :edit
    end
  end
  
  def destroy
    @teacher = Teacher.find(params[:id])
    if @teacher.destroy
      redirect_to teachers_path
    else
      render :action => :index
    end
  end
  
  private
  def teacher_params
#    params.require(:teacher).permit(:active, :name, :age, :captcha, :captcha_key)
     params.require(:teacher).permit!
  end
end