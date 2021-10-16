class GradesController < ApplicationController
  def create
    @student = Student.find(params[:student_id])

    grades = [grade_params[:test1], grade_params[:test2], grade_params[:test3], grade_params[:exam]]
    params[:grade][:situation] = calc_situation(grades)

    @grade = @student.create_grade(grade_params)
    redirect_to student_path(@student)
  end

  private
    def grade_params
      params.require(:grade).permit(:test1, :test2, :test3, :exam, :situation)
    end

    def calc_situation(grades)
      sum = grades.map! { |v| v.to_i}.sum
      case
      when sum < 5
        'Failed' 
      when sum < 7
        'Recovering'
      when sum <= 10
        'Approved'
      else
        'Error'
      end
    end

end
