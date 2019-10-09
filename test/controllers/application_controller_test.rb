require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'Should Get Text' do
    get root_path
    assert_response :success
    assert_select 'h1', 'Hello World !'
  end
end
