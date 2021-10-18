class GradesController < ApplicationController
  def edit
    @student = Student.find(params[:student_id])
    @assessment = Assessment.all[0]
  end

  def create
    @student = Student.find(params[:student_id])
    @assessment = Assessment.all[0]

    init_with_zero
    verify_max_grade
    if @student.errors.any?
      render :edit
      return
    end

    grades = [grade_params[:test1], grade_params[:test2], grade_params[:test3], grade_params[:exam]]
    params[:grade][:situation] = calc_situation(grades)

    @grade = @student.create_grade(grade_params)
    redirect_to student_path(@student)
  end

  def update
    @student = Student.find(params[:student_id])
    @assessment = Assessment.all[0]

    verify_max_grade
    if @student.errors.any?
      render :edit
      return
    end

    grades = [grade_params[:test1], grade_params[:test2], grade_params[:test3], grade_params[:exam]]
    params[:grade][:situation] = calc_situation(grades)

    @grade = @student.update_grade(grade_params)
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

    def verify_max_grade
      assessment = Assessment.all[0]
      if grade_params[:test1].to_i > @assessment.test1
        @student.errors[:test1] << "Must be less or equal to #{@assessment.test1}."
      end

      if grade_params[:test2].to_i > @assessment.test2
        @student.errors[:test2] << "Must be less or equal to #{@assessment.test2}."
      end

      if grade_params[:test3].to_i > @assessment.test3
        @student.errors[:test3] << "Must be less or equal to #{@assessment.test3}."
      end

      if grade_params[:exam].to_i > 5
        @student.errors[:exam] << "Must be less or equal to 5."
      end
    end

    def init_with_zero
      if grade_params[:test1].nil?
        params[:grade][:test1] = "0"
      end
      if grade_params[:test2].nil?
        params[:grade][:test2] = "0"
      end
      if grade_params[:test3].nil?
        params[:grade][:test3] = "0"
      end
      if grade_params[:exam].nil?
        params[:grade][:exam] = "0"
      end
    end
end
