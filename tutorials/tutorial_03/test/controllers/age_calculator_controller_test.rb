require "test_helper"

class AgeCalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get age_form" do
    get age_calculator_age_form_url
    assert_response :success
  end
end
