require 'test_helper'

class ArchiveControllerTest < ActionDispatch::IntegrationTest
  test "should get show_archive" do
    get archive_show_archive_url
    assert_response :success
  end

end
