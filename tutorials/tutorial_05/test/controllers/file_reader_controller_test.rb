require "test_helper"

class FileReaderControllerTest < ActionDispatch::IntegrationTest
  test "should get read_file" do
    get file_reader_read_file_url
    assert_response :success
  end
end
