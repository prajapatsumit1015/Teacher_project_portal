class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = current_user.students.order(created_at: :desc)
  end

  def create
    student = current_user.students.find_by(name: params[:name], subject: params[:subject])
    if student
      student.marks = params[:marks]
      student.save
    else
      current_user.students.create(name: params[:name], subject: params[:subject], marks: params[:marks].to_i)
    end

    redirect_to students_path
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to students_url, notice: 'Student was successfully updated.'
    else
      redirect_to students_url, notice: 'Student was not updated.'
    end
  end

  def destroy
    student = current_user.students.find(params[:id])
    student.destroy
    redirect_to students_url
  end

  private

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end
end
