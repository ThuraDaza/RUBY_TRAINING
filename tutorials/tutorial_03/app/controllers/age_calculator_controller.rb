class AgeCalculatorController < ApplicationController

  def age_form
    puts params[:born_on]

    if params.has_key?(:born_on) 
      @date_of_birth = Date.parse(params[:born_on])
      years = ((Time.zone.now - @date_of_birth.to_time) / 1.year.seconds).floor

      if years <= 0

        daysDiff = (Date.today.to_date - @date_of_birth.to_date).to_i
        months = (daysDiff/30).floor
        days = daysDiff-(months*30)
      end
      
      redirect_to age_result_path(passed_parameter: [years, months, days])
    end
  end
  
  def age_result
    passed_parameter = params[:passed_parameter]
    @year = passed_parameter[0].to_i
    @month = passed_parameter[1].to_i
    @day = passed_parameter[2].to_i
    puts "dob==== #{@date_of_birth}"
  end
  
end
