require "test_helper"

class QrGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get build_qr" do
    get qr_generator_build_qr_url
    assert_response :success
  end

  test "should get show_qr" do
    get qr_generator_show_qr_url
    assert_response :success
  end
end
