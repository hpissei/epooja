require 'test_helper'

class PoojasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get poojas_index_url
    assert_response :success
  end

end
