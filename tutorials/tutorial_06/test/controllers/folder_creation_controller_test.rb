require "test_helper"

class FolderCreationControllerTest < ActionDispatch::IntegrationTest
  test "should get read_file" do
    get folder_creation_read_file_url
    assert_response :success
  end
end
